require 'administrate/base_dashboard'

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String,
    last_sign_in_ip: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    username: Field::String,
    deleted_at: Field::DateTime,
    invitation_token: Field::String,
    invitation_sent_at: Field::DateTime,
    invitation_accepted_at: Field::DateTime,
    invitation_limit: Field::Number,
    invited_by_id: Field::Number,
    invited_by_type: Field::String,
    calendar_url: Field::String,
    calendar_token: Field::String,
    failed_attempts: Field::Number,
    unlock_token: Field::String,
    locked_at: Field::DateTime,
    invitation_created_at: Field::DateTime,
    show_archived_experiments: Field::Boolean,
    avatar: Field::String,
    fullname: Field::String,
    url: Field::String,
    location: Field::String,
    laboratory: Field::String,
    show_archived_reagents: Field::Boolean,
    show_tasks: Field::String,
    mendeley_token: Field::String,
    mendeley_refresh_token: Field::String,
    provider: Field::String,
    uid: Field::String,
    tokens: Field::String.with_options(searchable: false),
    persistent_allow_password_change: Field::Boolean,
    investigator_id: Field::Number,
    google_calendar_api_key: Field::String,
    show_archived_data: Field::Boolean,
    allow_password_change: Field::Boolean
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    email
    encrypted_password
    reset_password_token
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    email
    encrypted_password
    reset_password_token
    reset_password_sent_at
    remember_created_at
    sign_in_count
    current_sign_in_at
    last_sign_in_at
    current_sign_in_ip
    last_sign_in_ip
    created_at
    updated_at
    username
    deleted_at
    invitation_token
    invitation_sent_at
    invitation_accepted_at
    invitation_limit
    invited_by_id
    invited_by_type
    calendar_url
    calendar_token
    failed_attempts
    unlock_token
    locked_at
    invitation_created_at
    show_archived_experiments
    avatar
    fullname
    url
    location
    laboratory
    show_archived_reagents
    show_tasks
    mendeley_token
    mendeley_refresh_token
    provider
    uid
    tokens
    persistent_allow_password_change
    investigator_id
    google_calendar_api_key
    show_archived_data
    allow_password_change
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    email
    encrypted_password
    reset_password_token
    reset_password_sent_at
    remember_created_at
    sign_in_count
    current_sign_in_at
    last_sign_in_at
    current_sign_in_ip
    last_sign_in_ip
    username
    deleted_at
    invitation_token
    invitation_sent_at
    invitation_accepted_at
    invitation_limit
    invited_by_id
    invited_by_type
    calendar_url
    calendar_token
    failed_attempts
    unlock_token
    locked_at
    invitation_created_at
    show_archived_experiments
    avatar
    fullname
    url
    location
    laboratory
    show_archived_reagents
    show_tasks
    mendeley_token
    mendeley_refresh_token
    provider
    uid
    tokens
    persistent_allow_password_change
    investigator_id
    google_calendar_api_key
    show_archived_data
    allow_password_change
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
