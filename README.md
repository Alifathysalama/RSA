# RSA
RSA is a public-key cryptosystem that is widely used for secure data transmission. A public-key
cryptosystem means that data is encrypted and decrypted using two different keys: private key and
public key, respectively. This provides added data security but adds the complexity of the sharing and
generating the private and public keys between sender and receiver.
The encryption process is given by the following equation:
c = m^e mod n
Similarly, the decryption process is given by the following equation:

m = c^d mod n

As we can see from the previous equations, both operations can be broken down into two steps:
exponentiation, and modulo (remainder) operation.
The focus of this project is to utilize as few SLICEs/CLBs as possible. This is done by making good usage of
other FPGA resources such as DSP slices and BRAM.
The top-level architecture diagram should be similar to the following:
![image](https://github.com/Alifathysalama/RSA/assets/104265727/5f6e48e3-f5bf-49ee-881d-384bd3082cb3)

here is the Synthesis of the project 
![image](https://github.com/Alifathysalama/RSA/assets/104265727/541a6193-6b27-45df-828a-aff0a922b455)
![image](https://github.com/Alifathysalama/RSA/assets/104265727/246c4843-e3b5-44cd-b5be-1c788630db4f)


The proposed architecture illustrates the usage of a counter combined with a Multiplier followed by the
modulo operation. This is to mitigate the increase in number of bits for the result value. This is illustrated
by the following equation:

(a × b)mod n = (a mod n) × (b mod n)

There are also Start and Done signals that are used to start the operation and indicate that it has
finished the operation, respectively.
As for the modulo operation, it will be done using a BRAM implementation for the module.
