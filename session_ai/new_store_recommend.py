import turicreate as tc

model = tc.load_model("recommendations.model")

user_info = tc.SFrame({ 'users': ['New Rock', 'New Paper'], 'is_in_shopping_mall': [False, True] })
recommendations = model.recommend(users=['New Rock', 'New Paper'], new_user_data=user_info, k=10)

recommendations.print_rows(num_rows=20)
