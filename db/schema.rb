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

ActiveRecord::Schema.define(version: 20_180_820_130_139) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'
  enable_extension 'hstore'

  create_table 'active_admin_comments', id: :serial, force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_id', null: false
    t.string 'resource_type', null: false
    t.integer 'author_id'
    t.string 'author_type'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'activities', force: :cascade do |t|
    t.string 'trackable_type'
    t.bigint 'trackable_id'
    t.string 'owner_type'
    t.bigint 'owner_id'
    t.string 'key'
    t.text 'parameters'
    t.string 'recipient_type'
    t.bigint 'recipient_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[owner_id owner_type], name: 'index_activities_on_owner_id_and_owner_type'
    t.index %w[owner_type owner_id], name: 'index_activities_on_owner_type_and_owner_id'
    t.index %w[recipient_id recipient_type], name: 'index_activities_on_recipient_id_and_recipient_type'
    t.index %w[recipient_type recipient_id], name: 'index_activities_on_recipient_type_and_recipient_id'
    t.index %w[trackable_id trackable_type], name: 'index_activities_on_trackable_id_and_trackable_type'
    t.index %w[trackable_type trackable_id], name: 'index_activities_on_trackable_type_and_trackable_id'
  end

  create_table 'admin_users', id: :serial, force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'datasets', id: :serial, force: :cascade do |t|
    t.string 'name'
    t.text 'method'
    t.text 'description'
    t.string 'mendeley_data_link'
    t.integer 'user_id'
    t.integer 'resource_id'
    t.string 'resource_type'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string 'licence'
    t.string 'category'
    t.index %w[resource_type resource_id], name: 'index_datasets_on_resource_type_and_resource_id'
    t.index ['user_id'], name: 'index_datasets_on_user_id'
  end

  create_table 'documents', id: :serial, force: :cascade do |t|
    t.string 'title'
    t.string 'doc_type'
    t.string 'publisher'
    t.integer 'user_id'
    t.integer 'resource_id'
    t.string 'resource_type'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index %w[resource_type resource_id], name: 'index_documents_on_resource_type_and_resource_id'
    t.index ['user_id'], name: 'index_documents_on_user_id'
  end

  create_table 'events', id: :serial, force: :cascade do |t|
    t.integer 'subject_id'
    t.string 'subject_type'
    t.string 'action'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'user_id'
  end

  create_table 'events_users', id: :serial, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'event_id'
  end

  create_table 'experiments', id: :serial, force: :cascade do |t|
    t.string 'title'
    t.text 'content'
    t.integer 'user_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.datetime 'start_at'
    t.datetime 'end_at'
    t.datetime 'archived_at'
    t.integer 'project_id'
    t.integer 'pdf_version', default: 0
    t.boolean 'all_day', default: false
  end

  create_table 'experiments_files', id: :serial, force: :cascade do |t|
    t.string 'name'
    t.string 'url'
    t.integer 'experiment_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.text 'uuid'
  end

  create_table 'experiments_reagents', id: :serial, force: :cascade do |t|
    t.integer 'experiment_id'
    t.integer 'reagent_id'
  end

  create_table 'inventories', id: :serial, force: :cascade do |t|
    t.string 'title'
    t.datetime 'archived_at'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'inventories_users', id: :serial, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'inventory_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index %w[user_id inventory_id], name: 'index_inventories_users_on_user_id_and_inventory_id', unique: true
  end

  create_table 'notes', force: :cascade do |t|
    t.hstore 'contents'
    t.bigint 'reagent_id'
    t.index ['reagent_id'], name: 'index_notes_on_reagent_id'
  end

  create_table 'oauth_access_grants', id: :serial, force: :cascade do |t|
    t.integer 'resource_owner_id', null: false
    t.integer 'application_id', null: false
    t.string 'token', null: false
    t.integer 'expires_in', null: false
    t.string 'redirect_uri', null: false
    t.datetime 'created_at', null: false
    t.datetime 'revoked_at'
    t.string 'scopes'
    t.index ['token'], name: 'index_oauth_access_grants_on_token', unique: true
  end

  create_table 'oauth_access_tokens', id: :serial, force: :cascade do |t|
    t.integer 'resource_owner_id'
    t.integer 'application_id'
    t.string 'token', null: false
    t.string 'refresh_token'
    t.integer 'expires_in'
    t.datetime 'revoked_at'
    t.datetime 'created_at', null: false
    t.string 'scopes'
    t.index ['refresh_token'], name: 'index_oauth_access_tokens_on_refresh_token', unique: true
    t.index ['resource_owner_id'], name: 'index_oauth_access_tokens_on_resource_owner_id'
    t.index ['token'], name: 'index_oauth_access_tokens_on_token', unique: true
  end

  create_table 'oauth_applications', id: :serial, force: :cascade do |t|
    t.string 'name', null: false
    t.string 'uid', null: false
    t.string 'secret', null: false
    t.string 'redirect_uri', null: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'owner_id'
    t.string 'owner_type'
    t.string 'scopes', default: '', null: false
    t.index %w[owner_id owner_type], name: 'index_oauth_applications_on_owner_id_and_owner_type'
    t.index ['uid'], name: 'index_oauth_applications_on_uid', unique: true
  end

  create_table 'projects', id: :serial, force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.datetime 'archived_at'
  end

  create_table 'projects_users', id: :serial, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'project_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index %w[user_id project_id], name: 'index_projects_users_on_user_id_and_project_id', unique: true
  end

  create_table 'protocols', id: :serial, force: :cascade do |t|
    t.string 'title'
    t.text 'content'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'user_id'
    t.integer 'pdf_version', default: 0
    t.boolean 'public', default: false
  end

  create_table 'reagents', id: :serial, force: :cascade do |t|
    t.string 'title'
    t.string 'price'
    t.string 'unit_size'
    t.string 'location'
    t.string 'url'
    t.date 'expires_at'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'inventory_id'
    t.datetime 'archived_at'
    t.string 'inventory_unique_id'
    t.index %w[inventory_unique_id inventory_id], name: 'index_reagents_on_inventory_unique_id_and_inventory_id', unique: true
  end

  create_table 'sessions', force: :cascade do |t|
    t.string 'session_id', null: false
    t.text 'data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['session_id'], name: 'index_sessions_on_session_id', unique: true
    t.index ['updated_at'], name: 'index_sessions_on_updated_at'
  end

  create_table 'share_links', id: :serial, force: :cascade do |t|
    t.integer 'protocol_id'
    t.string 'key'
    t.datetime 'expires_at'
  end

  create_table 'signatures', id: :serial, force: :cascade do |t|
    t.integer 'experiment_id'
    t.integer 'user_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.text 'encrypted'
    t.datetime 'deleted_at'
    t.boolean 'valid_encryption', default: false
    t.datetime 'encryption_checked_at'
  end

  create_table 'tasks', id: :serial, force: :cascade do |t|
    t.integer 'user_id'
    t.text 'content'
    t.boolean 'done', default: false
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'users', id: :serial, force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: ''
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string 'username'
    t.datetime 'deleted_at'
    t.string 'invitation_token'
    t.datetime 'invitation_sent_at'
    t.datetime 'invitation_accepted_at'
    t.integer 'invitation_limit'
    t.integer 'invited_by_id'
    t.string 'invited_by_type'
    t.string 'calendar_url'
    t.string 'calendar_token'
    t.integer 'failed_attempts', default: 0
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.datetime 'invitation_created_at'
    t.boolean 'show_archived_experiments', default: false
    t.string 'avatar'
    t.string 'fullname'
    t.string 'url'
    t.string 'location'
    t.string 'laboratory'
    t.boolean 'show_archived_reagents', default: false
    t.string 'show_tasks', default: 'all'
    t.string 'mendeley_token'
    t.string 'mendeley_refresh_token'
    t.string 'provider', default: 'email', null: false
    t.string 'uid', default: '', null: false
    t.json 'tokens'
    t.boolean 'persistent_allow_password_change', default: false, null: false
    t.bigint 'investigator_id'
    t.string 'google_calendar_api_key'
    t.boolean 'show_archived_data', default: false
    t.boolean 'allow_password_change', default: false, null: false
    t.index %w[email deleted_at], name: 'index_users_on_email_and_deleted_at', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['investigator_id'], name: 'index_users_on_investigator_id'
    t.index ['invitation_token'], name: 'index_users_on_invitation_token', unique: true
    t.index ['invited_by_id'], name: 'index_users_on_invited_by_id'
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index %w[uid provider], name: 'index_users_on_uid_and_provider', unique: true
    t.index %w[username deleted_at], name: 'index_users_on_username_and_deleted_at', unique: true
  end

  create_table 'versions', id: :serial, force: :cascade do |t|
    t.integer 'experiment_id'
    t.text 'content'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.boolean 'visible', default: false
    t.string 'user_ip'
    t.string 'user_email'
    t.string 'change_type'
    t.integer 'signature_id'
    t.integer 'countersignature_id'
    t.integer 'user_id'
  end

  add_foreign_key 'users', 'users', column: 'investigator_id'
end
