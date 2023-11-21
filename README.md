# Functional and Formal Verification of Digital Design 

Team Members:Sindhu, Anurup, Tanushree, Dhanush

Topic: Universal Shift Register 

Schematic Diagram:
<img width="410" alt="image" src="https://github.com/SindhuCP/FFVDD/assets/148478177/38bec85e-9e85-40e2-810d-e150b322a9e1">


Output Waveform:

<img width="817" alt="image" src="https://github.com/SindhuCP/FFVDD/assets/148478177/6a31346b-ea51-4dd6-b1ac-466152982f4e">
<img width="820" alt="image" src="https://github.com/SindhuCP/FFVDD/assets/148478177/f699a166-e8d3-4820-b727-75d9ed3b7e9e">
<img width="824" alt="image" src="https://github.com/SindhuCP/FFVDD/assets/148478177/95bb7e85-d4bb-438b-9546-092a3e245059">

Notes:
-> when ctlr is 11, whatever is at the input is at the output

-> when ctlr is 01, we do left shift and append 1 

-> when ctlr is 10, we do right shift and append 0

-> serial_out tells us what is being appended

-> data is our output


Code Coverage:
Without Layered Testbench:
<img width="754" alt="image" src="https://github.com/SindhuCP/FFVDD/assets/148478177/efe6063b-6f05-48c5-8177-1fed2689066a">

With Layered Testbench:
<img width="758" alt="image" src="https://github.com/SindhuCP/FFVDD/assets/148478177/c25f5907-4cc3-4b20-bfa3-d5b31d3cddde">
