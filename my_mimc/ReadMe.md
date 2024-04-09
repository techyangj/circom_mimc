circom circuit.circom --r1cs --wasm

node ./circom_js/generate_witness.js ./circom_js/circom.wasm input.json output.wtns

narkjs wtns export json output.wtns output.json