circom circuit.circom --r1cs --wasm

node ./circom_js/generate_witness.js ./circom_js/circom.wasm input.json witness.wtns

snarkjs wtns export json witness.wtns witness.json


