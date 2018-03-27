import turicreate as tc

data = tc.SFrame({ 'user_id': ['R075', 'R075', 'R075', 'R075', 'R017', 'R017', 'R017', 'R017', 'R001', 'R001'],
                   'item_id': ['iPhone Basics', 'iPhone Basics', 'PhotoWalks', 'PhotoWalks', 'iPhone Basics', 'iPhone Basics', 'PhotoWalks', 'PhotoWalks', 'iPad Basics', 'Painting'],
                   'categories': ['How to', 'How to','Creative','Creative','How to','How to','Creative','Creative', 'How to', 'Creative'],
                   'rating': [5, 4, 2, 1, 2, 1, 5, 3, 1, 1]
                })

m = tc.recommender.create(data, target='rating')

recommendations = m.recommend(exclude_known=False, users=['R075', 'R017'])

print(recommendations)
