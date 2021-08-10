# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_09_162616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orepro_predictions", comment: "俺プロ予想", force: :cascade do |t|
    t.string "race_id", null: false, comment: "netkeibaレースID"
    t.string "email", null: false, comment: "メールアドレス"
    t.integer "honmei", null: false, comment: "本命の馬番"
    t.integer "taikou", comment: "対抗の馬番"
    t.integer "tanana", comment: "単穴の馬番"
    t.string "renkas", comment: "連下の馬番（複数）"
  end

end
