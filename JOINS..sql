-- Databricks notebook source
-- Q1: INNER JOIN - users who have a subscription
SELECT A.user_id, A.user_name, B.subscription_id, B.start_date
FROM workspace.default.users AS A
INNER JOIN workspace.default.subscriptions AS B ON A.user_id = B.user_id;

-- Q2: INNER JOIN - subscriptions with plan name and price
SELECT A.subscription_id, A.user_id, B.plan_name, B.monthly_price
FROM workspace.default.subscriptions AS A
INNER JOIN workspace.default.plans AS B ON A.plan_id = B.plan_id;

-- Q3: INNER JOIN - viewing sessions with matching show
SELECT A.session_id, A.user_id, B.show_title, B.genre, A.watch_minutes
FROM workspace.default.viewing_sessions AS A
INNER JOIN workspace.default.shows AS B ON A.show_id = B.show_id;

-- Q4: INNER JOIN - viewing sessions with valid user
SELECT B.user_name, B.country, A.session_id, A.show_id, A.watch_minutes
FROM workspace.default.viewing_sessions AS A
INNER JOIN workspace.default.users AS B ON A.user_id = B.user_id;

-- Q5: INNER JOIN - users with subscription and valid plan (3 tables)
SELECT A.user_name, A.country, C.plan_name, C.monthly_price, B.start_date
FROM workspace.default.users AS A
INNER JOIN workspace.default.subscriptions AS B ON A.user_id = B.user_id
INNER JOIN workspace.default.plans AS C ON B.plan_id = C.plan_id;

-- Q6: LEFT JOIN - all users with any subscription (users without subscriptions show NULL)
SELECT A.user_id, A.user_name, B.subscription_id, B.start_date
FROM workspace.default.users AS A
LEFT JOIN workspace.default.subscriptions AS B ON A.user_id = B.user_id;

-- Q7: LEFT JOIN - all plans with any subscription (plans without subscribers show NULL)
SELECT A.plan_id, A.plan_name, B.subscription_id, B.user_id
FROM workspace.default.plans AS A
LEFT JOIN workspace.default.subscriptions AS B ON A.plan_id = B.plan_id;

-- Q8: LEFT JOIN - all shows with any viewing session (unwatched shows show NULL)
SELECT A.show_id, A.show_title, B.session_id, B.watch_minutes
FROM workspace.default.shows AS A
LEFT JOIN workspace.default.viewing_sessions AS B ON A.show_id = B.show_id;

-- Q9: LEFT JOIN - all viewing sessions with user (sessions with invalid user show NULL)
SELECT A.session_id, A.show_id, A.watch_minutes, B.user_id, B.user_name
FROM workspace.default.viewing_sessions AS A
LEFT JOIN workspace.default.users AS B ON A.user_id = B.user_id;

-- Q10: LEFT JOIN - all users, their plan (if any), and price (3 tables)
SELECT A.user_name, A.country, C.plan_name, C.monthly_price
FROM workspace.default.users AS A
LEFT JOIN workspace.default.subscriptions AS B ON A.user_id = B.user_id
LEFT JOIN workspace.default.plans AS C ON B.plan_id = C.plan_id;

-- Q11: FULL OUTER JOIN - all users and all subscriptions (unmatched on either side)
SELECT A.user_id, A.user_name, B.subscription_id, B.start_date
FROM workspace.default.users AS A
FULL OUTER JOIN workspace.default.subscriptions AS B ON A.user_id = B.user_id;

-- Q12: FULL OUTER JOIN - all plans and all subscriptions (unmatched on either side)
SELECT A.plan_id, A.plan_name, B.subscription_id, B.user_id
FROM workspace.default.plans AS A
FULL OUTER JOIN workspace.default.subscriptions AS B ON A.plan_id = B.plan_id;

-- Q13: FULL OUTER JOIN - all shows and all viewing sessions (unmatched on either side)
SELECT A.show_id, A.show_title, B.session_id, B.watch_minutes
FROM workspace.default.shows AS A
FULL OUTER JOIN workspace.default.viewing_sessions AS B ON A.show_id = B.show_id;

-- Q14: FULL OUTER JOIN - all users and all viewing sessions (unmatched on either side)
SELECT A.user_id, A.user_name, B.session_id, B.show_id, B.watch_minutes
FROM workspace.default.users AS A
FULL OUTER JOIN workspace.default.viewing_sessions AS B ON A.user_id = B.user_id;

-- Q15: FULL OUTER JOIN - users, subscriptions, and plans (all three, all gaps visible)
SELECT A.user_id, A.user_name, B.subscription_id, C.plan_id, C.plan_name
FROM workspace.default.users AS A
FULL OUTER JOIN workspace.default.subscriptions AS B ON A.user_id = B.user_id
FULL OUTER JOIN workspace.default.plans AS C ON B.plan_id = C.plan_id;