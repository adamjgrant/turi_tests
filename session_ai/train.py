import turicreate as tc
sessions  = tc.SFrame.read_csv('./dataset/session_data/session_data.csv')
user_data = tc.SFrame.read_csv('./dataset/session_data/user_data.csv')

training_data, validation_data = tc.recommender.util.random_split_by_user(sessions, 'user_id', 'item_id')
model = tc.factorization_recommender.create(training_data, target='rating', user_data=user_data)

model.save("recommendations.model")
