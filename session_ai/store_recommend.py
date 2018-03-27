import turicreate as tc

model = tc.load_model("recommendations.model")

number_of_results_per_store=8
stores = ["Rock", "Paper", "Scissors", "Lizard", "Spock"]

recommendations = model.recommend(exclude_known=False, users=stores, k=number_of_results_per_store)

recommendations.print_rows(num_rows=(len(stores) * number_of_results_per_store))
