#!/bin/bash

dot -Tpng dependency_graph.dot -o dependency_graph.png
echo "Graph generated successfully: dependency_graph.png"
