# Session AI

## About

Retail AI

- We curate special sessions for our customers in stores all over the world.
- Yet our sessions should be curated to the uniqueness of each store's customer demographics.
- We see already stories of stores frequently hosting sessions with 0 attendance.
- How do we scale our operations to program our content tailored to this diversity?
- We could write some computer programs that line up attendance rates with sessions
    - But we end up having to start all over when new sessions are introduced.
    - It doesn't tell us much about what other sessions might be close seconds.
- We could write a program to rank session categories with attendance rates
    - We have to start all over again when a new store is introduced.
- These approaches also don't work because we assume all along the answer happens between two or even three columns of data. But in reality...
    - A session could work in one store due to the relation between that neighborhood's median income and the technical qualities of the session.
    - Simultaneously, another session could work in another store having nothing to do with median income and everything to do with the fact it's in a shopping mall.
    - Simultaneous to those two scenarios, a session could work in a third store 50% because of median income, 25% because of the creativity content of a session, and 25% because of the store's proximity to a school.
- When we run into huge complex relationships like this, we often have to rely on a human in each of the stores who has a more accurate, yet still error prone "vibe" of what will or what won't work.
- We can solve this problem with a computer using Artificial Intelligence.
- In AI, there is a concept of a "Neural Network," which simulates the very neurons that make up our brain using mathematical functions and statistical models to facilitate reinforced learning.
- We created a neural network that can look at these large sets of data—the larger, the better—and accurately predict what sessions will work well in which stores.

Example: A tale of three cities

- Rock, Paper, and Scissors are three Apple Stores in different places in the world.
- We'll look at sessions in three categories:
    - How Tos
    - Kids Hour
    - Photo Walks
- For arbitrary reasons, we'll say that the secret sauce to scheduling these sessions (pretend we don't actually know this) is as follows
    - How Tos: Preferred by stores in areas with a high median income
    - Kids Hour: Preferred by stores in shopping malls
    - Photo Walks: Preferred by stores tending to both low-medium median income and proximity to a school.
- Rock, Paper and Scissors will respectively match to each of these session categories for this example. How Tos will perform better in Rock because it has a high median income, Kids Hours will work better in Paper because it's an Apple Store in a shopping mall and so on.
- But remember that in the real world, we wouldn't know these relationships exist yet. So these three stores also have a lot of demographic data we collected that turn out to be useless.
- Rock, Paper, and Scissors will all have data on their region's income levels, neighborhood information, store size, layout, etc.
- Our neural network will need to figure out what data actually matters and be able to correlate future data.
    - Even for new sessions we've never scheduled before, even for new stores we've never opened.
- Our neural network will even be able to pivot when the information has changed.
    - If median income stops being a good predictor for attendance to How Tos, it will learn that in future training.

## Usage

This is a proof of concept for a neural network that can learn how to recommend sessions for a store based on prior attendance and a wide array of demographic data.

To see this in action, first make the dataset (instructions below) then

`python train.py`
`python store_recommend.py`

To play around with stuff edit or run

`python train_inline.py`

Requires [Turi](http://turi.com)

## Make dataset

To make the fake dataset, run 

`ruby dataset/session_data/create_dataset.rb`

