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

ActiveRecord::Schema.define(version: 20_210_125_112_447) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'addresses', force: :cascade do |t|
    t.string 'city'
    t.string 'street'
    t.integer 'houseNumber'
    t.string 'addressable_type'
    t.bigint 'addressable_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[addressable_type addressable_id], name: 'index_addresses_on_addressable_type_and_addressable_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.string 'name'
    t.string 'comment'
    t.bigint 'user_id', null: false
    t.bigint 'service_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['service_id'], name: 'index_comments_on_service_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'companies', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'avatar'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id'
    t.bigint 'address_id'
    t.index ['address_id'], name: 'index_companies_on_address_id'
    t.index ['user_id'], name: 'index_companies_on_user_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.string 'name'
    t.datetime 'start_time'
    t.datetime 'end_time'
    t.bigint 'user_id', null: false
    t.bigint 'service_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['service_id'], name: 'index_orders_on_service_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[name resource_type resource_id], name: 'index_roles_on_name_and_resource_type_and_resource_id'
    t.index %w[resource_type resource_id], name: 'index_roles_on_resource_type_and_resource_id'
  end

  create_table 'services', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'avatar'
    t.bigint 'company_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'time_limit_id'
    t.bigint 'user_id'
    t.index ['company_id'], name: 'index_services_on_company_id'
    t.index ['time_limit_id'], name: 'index_services_on_time_limit_id'
    t.index ['user_id'], name: 'index_services_on_user_id'
  end

  create_table 'time_limits', force: :cascade do |t|
    t.datetime 'start_time', null: false
    t.datetime 'end_time', null: false
    t.bigint 'user_id', null: false
    t.bigint 'service_id', null: false
    t.integer 'length'
    t.index ['service_id'], name: 'index_time_limits_on_service_id'
    t.index ['user_id'], name: 'index_time_limits_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'provider'
    t.string 'surname'
    t.string 'name'
    t.string 'uid'
    t.string 'avatar'
    t.string 'language'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'role_id'
    t.index ['role_id'], name: 'index_users_roles_on_role_id'
    t.index %w[user_id role_id], name: 'index_users_roles_on_user_id_and_role_id'
    t.index ['user_id'], name: 'index_users_roles_on_user_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'comments', 'services'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'companies', 'addresses'
  add_foreign_key 'companies', 'users'
  add_foreign_key 'orders', 'services'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'services', 'companies'
  add_foreign_key 'services', 'time_limits'
  add_foreign_key 'services', 'users'
  add_foreign_key 'time_limits', 'services'
  add_foreign_key 'time_limits', 'users'
end
