# ⚁ dice-sim

> Calculate and compare the probabilities of rolling specific sequences of numbers on a fair n-sided die.
> It is a practical tool for assessing the likelihood of achieving particular outcomes in dice-based games,
> simulations, or any scenario involving random dice rolls.

## Features

- Calculate the probability of rolling a specific number on the die.
- Determine the probability of rolling a sequence of numbers in multiple rolls.
- Compare the probabilities of two different sequences to identify the more likely outcome.

## Usage

1. Compile the Program: Compile the source code provided in the 'src/main.cpp' file.
   You can use a C++ compiler of your choice. I (and any Nix builds within this repository) use `gcc`

2. Run the Program: Execute the compiled program in your terminal or command prompt. The program accepts command-line arguments to customize the dice and sequences to be evaluated.

```bash
dice-sim -s 6 -r1 5 -r2 7 -t1 4 -t2 2
```

- `-s` or `--sides`: Set the number of sides on the die.
- `-r1` or `--rolls1`: Specify the number of rolls for the first sequence.
- `-r2` or `--rolls2`: Specify the number of rolls for the second sequence.
- `-t1` or `--target1`: Set the target number for the first sequence.
- `-t2` or `--target2`: Set the target number for the second sequence.

3. Observe: The program will display the calculated probabilities for the specified sequences and inform you which sequence is more likely to occur.

### Example Usage

```bash
dice-sim -s 6 -r1 5 -r2 7 -t1 4 -t2 2
```

This command will calculate the probabilities for two sequences:

- **Sequence 1**: Rolling '4' on a 6-sided die for 5 consequtive rolls.
- **Sequence 2**: Rolling '2' on a 6-sided die for 7 consequtive rolls.
