# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161030212638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rewards", force: :cascade do |t|
    t.string  "name"
    t.integer "cost"
    t.string  "image_link"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password_digest"
    t.integer "points",          default: 0
    t.integer "redeemed_points", default: 0
    t.integer "role",            default: 0
  end

  create_table "users_rewards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "reward_id"
    t.index ["reward_id"], name: "index_users_rewards_on_reward_id", using: :btree
    t.index ["user_id"], name: "index_users_rewards_on_user_id", using: :btree
  end

  add_foreign_key "users_rewards", "rewards"
  add_foreign_key "users_rewards", "users"
end
