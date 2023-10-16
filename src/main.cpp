#include "cxxopts.hpp"
#include <cmath>
#include <ctime>
#include <iostream>
#include <vector>

// Function to calculate the probability of rolling a specific number on a fair
// n-sided die
double calculateProbability(int sides, int target) {
  return 1.0 / sides; // Assuming all outcomes are equally likely
}

// Function to calculate the probability of a specific sequence of rolls
double calculateSequenceProbability(int sides,
                                    const std::vector<int> &sequence) {
  double probability = 1.0;
  for (int value : sequence) {
    probability *= calculateProbability(sides, value);
  }
  return probability;
}

int main(int argc, char *argv[]) {
  int sides = 20;    // Default number of sides on the dice (a d20)
  int numRolls1 = 5; // Default number of rolls for sequence 1
  int numRolls2 = 7; // Default number of rolls for sequence 2
  int target1 = 10;  // Default target number for sequence 1
  int target2 = 1;   // Default target number for sequence 2

  cxxopts::Options options(
      "DiceRollProbability",
      "Calculate and compare the probabilities of rolling sequences.");
  options.add_options()("s,sides", "Number of sides on the dice",
                        cxxopts::value<int>(sides))(
      "r1,rolls1", "Number of rolls for sequence 1",
      cxxopts::value<int>(numRolls1))("r2,rolls2",
                                      "Number of rolls for sequence 2",
                                      cxxopts::value<int>(numRolls2))(
      "t1,target1", "Target number for sequence 1",
      cxxopts::value<int>(target1))(
      "t2,target2", "Target number for sequence 2",
      cxxopts::value<int>(target2))("h,help", "Show help");

  auto result = options.parse(argc, argv);

  if (result.count("help")) {
    std::cout << options.help() << std::endl;
    return 0;
  }

  std::vector<int> sequence1(numRolls1, target1);
  std::vector<int> sequence2(numRolls2, target2);

  double probability1 = calculateSequenceProbability(sides, sequence1);
  double probability2 = calculateSequenceProbability(sides, sequence2);

  std::cout << "Probability of the first sequence: " << probability1
            << std::endl;
  std::cout << "Probability of the second sequence: " << probability2
            << std::endl;

  if (probability1 > probability2) {
    std::cout << "The first sequence is more likely to occur." << std::endl;
  } else if (probability1 < probability2) {
    std::cout << "The second sequence is more likely to occur." << std::endl;
  } else {
    std::cout << "Both sequences have the same probability of occurring."
              << std::endl;
  }

  return 0;
}
