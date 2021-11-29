import qiskit
from qiskit import QuantumCircuit

from cirq.contrib.qasm_import import circuit_from_qasm
import cirq.contrib.routing as ccr
import cirq
import recirq
import pytket.cirq
import pytket.qasm

def read_qasm_circuit(path):
    qasm_string = open(path, 'r').read()
    try:
        return circuit_from_qasm(qasm_string)
    except:
        print('wrong circuit format')

def get_circuit_depth(circuit):
    return len(cirq.Circuit(circuit.all_operations()))

# 1. scale up rochester
def generate_rochester_style_device(n=1000):
    count = 9
    connection_list = [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7), (7, 8)]
    last_row_indices = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    row_count = 1
    last_index = 8
    while count < n:
        if row_count % 2 == 1:
            if row_count == 1 or row_count % 4 == 3:
                connection_list.append((last_row_indices[0], last_index + 1))
                connection_list.append((last_row_indices[4], last_index + 2))
                connection_list.append((last_row_indices[8], last_index + 3))
                last_row_indices = [last_index + k for k in range(1, 4)]
            else:
                connection_list.append((last_row_indices[2], last_index + 1))
                connection_list.append((last_row_indices[6], last_index + 2))
                connection_list.append((last_row_indices[10], last_index + 3))
                last_row_indices = [last_index + k for k in range(1, 4)]
    
            last_index += 3
        else:
            if count + 9 >= n:
                connection_list.append((last_row_indices[0], last_index + 1))
                connection_list.append((last_row_indices[1], last_index + 5))
                connection_list.append((last_row_indices[2], last_index + 9))
                last_row_indices = [last_index + k for k in range(1, 10)]
                for k in range(1, 9):
                    connection_list.append((last_row_indices[k - 1], last_row_indices[k]))
                last_index += 9
            else:
                if row_count % 4 == 0:
                    connection_list.append((last_row_indices[0], last_index + 1))
                    connection_list.append((last_row_indices[1], last_index + 5))
                    connection_list.append((last_row_indices[2], last_index + 9))
                else:
                    connection_list.append((last_row_indices[0], last_index + 3))
                    connection_list.append((last_row_indices[1], last_index + 7))
                    connection_list.append((last_row_indices[2], last_index + 11))
                    
                last_row_indices = [last_index + k for k in range(1, 12)]
                for k in range(1, 11):
                    connection_list.append((last_row_indices[k - 1], last_row_indices[k]))
                        
                last_index += 11
                
        row_count += 1
        count += len(last_row_indices)
        
    return connection_list

import pytket
from pytket.circuit import Node
from pytket.predicates import CompilationUnit, ConnectivityPredicate
from pytket.routing import GraphPlacement
from pytket.passes import SequencePass, RoutingPass, DecomposeSwapsToCXs, PlacementPass

def _qubit_index_edges(device):
    index_to_qubit = sorted(device.qubit_set())
    qubit_to_index = {q: i for i, q in enumerate(index_to_qubit)}
    
    dev_graph = ccr.xmon_device_to_graph(device)
    for n1, n2 in dev_graph.edges:
        yield (qubit_to_index[n1], qubit_to_index[n2])

def _device_to_tket_device(device):
    arc = pytket.routing.Architecture(
        list(_qubit_index_edges(device))
    )
    print(list(_qubit_index_edges(device)))
    return pytket.device.Device({}, {}, arc)

def _device_connection_list_to_tket_device(device_connection_list):
    arc = pytket.routing.Architecture(device_connection_list)
    return pytket.device.Device({}, {}, arc)

def route_circuit_by_tket(circuit, device_connection_list):
    
    tk_circuit = circuit
    tk_device = _device_connection_list_to_tket_device(device_connection_list)
    print(tk_device)
    
    unit = CompilationUnit(tk_circuit, [ConnectivityPredicate(tk_device)])
    
    passes = SequencePass([
        PlacementPass(GraphPlacement(tk_device)),
        RoutingPass(tk_device, bridge_lookahead=0, bridge_interactions=0)]) # NO BRIDGE
    passes.apply(unit)
    valid = unit.check_all_predicates()
    
    assert valid
    
    routed_circuit = pytket.cirq.tk_to_cirq(unit.circuit)
        
    return routed_circuit

devices = [[(0, 1), (1, 2), (2, 3), (3, 4),
             (0, 5), (4, 6), (5, 9), (6, 13),
             (7, 8), (8, 9), (9, 10), (10, 11), (11, 12), (12, 13), (13, 14), (14, 15),
             (7, 16), (11, 17), (15, 18), (16, 19), (17, 23), (18, 27),
             (19, 20), (20, 21), (21, 22), (22, 23), (23, 24), (24, 25), (25, 26), (26, 27),
             (21, 28), (25, 29), (28, 32), (29, 36),
             (30, 31), (31, 32), (32, 33), (33, 34), (34, 35), (35, 36), (36, 37), (37, 38),
             (30, 39), (34, 40), (38, 41), (39, 42), (40, 46), (41, 50),
             (42, 43), (43, 44), (44, 45), (45, 46), (46, 47), (47, 48), (48, 49), (49, 50),
             (44, 51), (48, 52)]]
for i in range(1, 10):
    devices.append(generate_rochester_style_device(i * 100))

from random import random, randint, shuffle

# def generate_benchmark_circuit(connection_list, max_depth, d1=0.5, d2=0.5):
#     # read connection list
#     n = 0
#     for a, b in connection_list: n = max(n, max(a+1, b+1))
#     graph = [[] for i in range(n)]
#     for a, b in connection_list:
#         graph[a].append(b)
#         graph[b].append(a)
        
#     # random mapping
#     mapping = [i for i in range(n)]
#     shuffle(mapping)
        
#     circuit = QuantumCircuit(n)
#     c1 = int(max_depth * d1)
#     c2 = max_depth - c1
#     t1, t2 = 0, 0
    
#     k = randint(0, n-1)
    
#     for i in range(max_depth):
#         r = random()
#         if r < d1 and t1 < c1 or t2 >= c2:
#             circuit.h(mapping[k])
#             t1 += 1
#         else:
#             r_edge = graph[k][randint(0, len(graph[k]) - 1)]
#             circuit.cx(mapping[r_edge], mapping[k])
#             t2 += 1
            
#     t1, t2 = 0, 0
    
#     for i in range(max_depth):
#         r = random()
#         if r < d1 and t1 < c1 or t2 >= c2:
#             r_node = randint(0, n - 1)
#             if r_node == k: continue
#             circuit.h(mapping[r_node])
#             t1 += 1
#         else:
#             r_node = randint(0, n - 1)
#             r_edge = graph[r_node][randint(0, len(graph[r_node]) - 1)]
#             if r_edge == k or r_node == k: continue
#             circuit.cx(mapping[r_node], mapping[r_edge])
#             t2 += 1
    
#     return circuit


# for i, device in enumerate(devices):
#     for max_depth in [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000]:
#       for j in range(5):
#           temp_circuit = generate_benchmark_circuit(device, max_depth=max_depth)
#           with open(f'scaling/{i}_{max_depth}_{j}.qasm', 'w') as file:
#               file.write(temp_circuit.qasm())


import time
result = []
for i, device in enumerate(devices[:1]):
    for max_depth in [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000]:
        for j in range(5):
            now = time.time()
            f_path = f'scaling/{i}_{max_depth}.qasm'
            depth = -1
            tk_circuit = pytket.qasm.circuit_from_qasm(f_path)
            try:
                depth = get_circuit_depth(route_circuit_by_tket(tk_circuit, device))
            except:
                pass
            print(tk_circuit.n_qubits, tk_circuit.n_gates, j, depth, max_depth, time.time() - now)
            result.append((tk_circuit.n_qubits, tk_circuit.n_gates, j, depth, max_depth, time.time() - now))

import pickle
pickle.dump(result, open('result.pkl', 'wb'))