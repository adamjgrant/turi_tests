import turicreate as tc

model = tc.load_model("recommendations.model")

sessions_array = tc.SArray([1, 2])

sessions = model.get_similar_items(sessions_array, k=20)

print(sessions)
