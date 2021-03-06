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

ActiveRecord::Schema.define(version: 2020_07_16_082735) do

  create_table "albums", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "image"
    t.string "release_date"
  end

  create_table "artists", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "image"
  end

  create_table "artists_albums", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "artist_id", null: false
    t.string "album_id", null: false
    t.index ["album_id"], name: "index_artists_albums_on_album_id"
    t.index ["artist_id"], name: "index_artists_albums_on_artist_id"
  end

  create_table "artists_posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "artist_id", null: false
    t.bigint "post_id", null: false
    t.index ["artist_id"], name: "index_artists_posts_on_artist_id"
    t.index ["post_id"], name: "index_artists_posts_on_post_id"
  end

  create_table "artists_tracks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "artist_id", null: false
    t.string "track_id", null: false
    t.index ["artist_id"], name: "index_artists_tracks_on_artist_id"
    t.index ["track_id"], name: "index_artists_tracks_on_track_id"
  end

  create_table "musics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "album_id", null: false
    t.string "track_id", null: false
    t.index ["album_id"], name: "index_posts_on_album_id"
    t.index ["track_id"], name: "index_posts_on_track_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "tracks", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "album_id", null: false
    t.index ["album_id"], name: "index_tracks_on_album_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "image"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "artists_albums", "albums"
  add_foreign_key "artists_albums", "artists"
  add_foreign_key "artists_posts", "artists"
  add_foreign_key "artists_posts", "posts"
  add_foreign_key "artists_tracks", "artists"
  add_foreign_key "artists_tracks", "tracks"
  add_foreign_key "posts", "albums"
  add_foreign_key "posts", "tracks"
  add_foreign_key "posts", "users"
  add_foreign_key "tracks", "albums"
end
