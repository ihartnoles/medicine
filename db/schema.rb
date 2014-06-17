# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140523145507) do

  create_table "AffiliatesSpecialty", :id => false, :force => true do |t|
    t.integer "id",           :null => false
    t.integer "Affiliate_id", :null => false
    t.integer "Division_id",  :null => false
  end

  create_table "BasicScienceDisciplines", :primary_key => "Discipline_id", :force => true do |t|
    t.string "DisciplineName", :limit => 50
    t.date   "created_at"
  end

  create_table "COMHospitals", :id => false, :force => true do |t|
    t.string "name"
    t.string "name_listed"
    t.string "correctname"
  end

  create_table "affiliateinstitutions", :force => true do |t|
    t.integer  "affiliate_id"
    t.integer  "institution_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "affiliatelanguages", :force => true do |t|
    t.integer  "affiliate_id"
    t.integer  "language_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "affiliatepermissions", :force => true do |t|
    t.integer  "affiliate_id"
    t.integer  "permissionid"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "affiliateresearchareas", :force => true do |t|
    t.integer  "researcharea_id"
    t.integer  "affiliate_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.text     "researchdescription"
  end

  create_table "affiliates", :force => true do |t|
    t.string   "znumber"
    t.string   "prefix"
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.string   "suffix"
    t.string   "license"
    t.string   "homestreet"
    t.string   "homecity"
    t.string   "homestate"
    t.integer  "homezip"
    t.string   "officestreet"
    t.string   "officecity"
    t.string   "officestate"
    t.integer  "officezip"
    t.string   "homephone"
    t.string   "cellphone"
    t.string   "emergencyphone"
    t.string   "faxnumber"
    t.string   "otherphonenumber"
    t.string   "emailfau"
    t.string   "emailpersonal"
    t.string   "emailoffice"
    t.string   "emailother"
    t.boolean  "isfaculty"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "pidm"
  end

  create_table "annualevaluations", :force => true do |t|
    t.string   "duedate"
    t.string   "completeddate"
    t.integer  "evaluator_id"
    t.integer  "status_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "affiliate_id"
  end

  create_table "bannerqueues", :force => true do |t|
    t.string   "faunetid"
    t.string   "znumber"
    t.string   "suffix"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "dob"
    t.string   "emailfau"
    t.string   "homestreet"
    t.string   "homecity"
    t.string   "homestate"
    t.integer  "homezip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cap_dates", :force => true do |t|
    t.string   "certificatedate", :limit => 50
    t.string   "status"
    t.string   "meetingdate",     :limit => 50
    t.integer  "affiliate_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "capstatuses", :force => true do |t|
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "certifiedspecialities", :force => true do |t|
    t.integer  "affiliate_id"
    t.integer  "speciality_id"
    t.integer  "year"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "clinicaldivisions", :force => true do |t|
    t.string   "divisionname", :limit => 50
    t.datetime "created_at"
  end

  create_table "clinicalsections", :force => true do |t|
    t.string  "sectionname", :limit => 50
    t.integer "division_id"
  end

  create_table "com_affiliate", :id => false, :force => true do |t|
    t.float  "id",                        :limit => 53
    t.string "status"
    t.string "eligibility"
    t.string "category"
    t.string "cv"
    t.string "transcript"
    t.string "personnel"
    t.string "prefix"
    t.string "fname"
    t.string "mi"
    t.string "lname"
    t.string "suffix"
    t.string "specialty"
    t.string "license"
    t.string "home_address"
    t.string "home_city"
    t.string "home_county"
    t.string "home_state"
    t.string "home_zip"
    t.string "home_phone"
    t.string "home_fax"
    t.string "home_email"
    t.string "home_emergency_name"
    t.string "home_emergency_number"
    t.string "work_organization"
    t.string "work_address"
    t.string "work_city"
    t.string "work_county"
    t.string "work_state"
    t.string "work_zip"
    t.string "work_phone"
    t.string "work_cel"
    t.string "work_pager"
    t.string "work_fax"
    t.string "work_email"
    t.string "assistant_name"
    t.string "assistant_phone"
    t.string "assistant_email"
    t.string "hospital_appointments"
    t.string "teaching_experience"
    t.string "research_experience"
    t.string "honors_awards"
    t.string "medical_organizations"
    t.string "committees"
    t.string "community_service"
    t.string "notes"
    t.string "created"
    t.string "updated"
    t.string "deleted"
    t.string "path"
    t.float  "user_id",                   :limit => 53
    t.string "mail_preference"
    t.string "preclinical_teaching"
    t.string "clinical_teaching"
    t.string "physician_referral"
    t.string "other_source"
    t.string "participate_research"
    t.string "research_type"
    t.string "course"
    t.string "comments"
    t.string "rec_letter1"
    t.string "rec_letter2"
    t.string "completed_by_name"
    t.string "completed_by_phone"
    t.string "completed_by_relationship"
    t.string "interest_letter"
    t.string "fau_title"
    t.string "practice_type"
    t.string "interest_letter_date"
    t.string "rec_letter1_date"
    t.string "rec_letter2_date"
    t.string "cap_date"
    t.string "exp_date"
    t.string "loa_date"
    t.string "certificate_date"
    t.string "pform_date"
    t.string "fau_email"
    t.string "z_number"
    t.string "specialty_listed"
    t.string "currently_teaching"
  end

  create_table "com_appointment", :id => false, :force => true do |t|
    t.float  "id",             :limit => 53
    t.string "rank"
    t.string "school"
    t.string "beginning_date"
    t.string "ending_date"
    t.float  "affiliate_id",   :limit => 53
  end

  create_table "com_certification", :id => false, :force => true do |t|
    t.float  "id",           :limit => 53
    t.string "specialty"
    t.string "year"
    t.float  "affiliate_id", :limit => 53
  end

  create_table "com_education", :id => false, :force => true do |t|
    t.float  "id",           :limit => 53
    t.string "degree"
    t.string "year"
    t.string "institution"
    t.string "country"
    t.float  "affiliate_id", :limit => 53
  end

  create_table "com_hospital", :id => false, :force => true do |t|
    t.float  "id",           :limit => 53
    t.string "name"
    t.float  "affiliate_id", :limit => 53
    t.string "name_listed"
  end

  create_table "com_licensure", :id => false, :force => true do |t|
    t.float  "id",           :limit => 53
    t.string "number"
    t.string "state"
    t.string "years"
    t.string "status"
    t.float  "affiliate_id", :limit => 53
  end

  create_table "com_log", :id => false, :force => true do |t|
    t.float  "id",           :limit => 53
    t.string "date_time"
    t.string "ip"
    t.string "user_name"
    t.string "action"
    t.float  "affiliate_id", :limit => 53
  end

  create_table "com_teaching", :id => false, :force => true do |t|
    t.float  "id",           :limit => 53
    t.string "ENGINE"
    t.string "title"
    t.string "period"
    t.float  "affiliate_id", :limit => 53
  end

  create_table "com_training", :id => false, :force => true do |t|
    t.float  "id",           :limit => 53
    t.string "specialty"
    t.string "years"
    t.string "institution"
    t.float  "affiliate_id", :limit => 53
  end

  create_table "contacts", :force => true do |t|
    t.string   "sentby"
    t.string   "subject"
    t.text     "msg"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "abbreviation"
    t.string   "country"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "cvs", :force => true do |t|
    t.integer  "affiliate_id"
    t.string   "path"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "degreelists", :force => true do |t|
    t.string   "degreename"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "degrees", :force => true do |t|
    t.integer  "degreelist_id"
    t.integer  "year"
    t.integer  "institution_id"
    t.integer  "affiliate_id"
    t.string   "city"
    t.integer  "state"
    t.integer  "country"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "disciplinaryactions", :force => true do |t|
    t.integer  "affiliate_id"
    t.string   "disciplinaryaction"
    t.string   "removed"
    t.string   "date"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "evaluationstatuses", :force => true do |t|
    t.text     "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fellowships", :force => true do |t|
    t.integer  "specialty_id"
    t.string   "location"
    t.string   "training"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "affiliate_id"
  end

  create_table "hospitalprivileges", :force => true do |t|
    t.integer  "hospital_id"
    t.integer  "affiliate_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "hospitals", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "institutions", :force => true do |t|
    t.string   "institutionname"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "languages", :force => true do |t|
    t.integer  "language_id"
    t.string   "language"
    t.string   "abbreviation"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "licenses", :force => true do |t|
    t.integer  "affiliate_id"
    t.string   "licensenumber"
    t.string   "state"
    t.integer  "year"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "permissiongroups", :force => true do |t|
    t.string   "groupname"
    t.string   "description"
    t.integer  "bits"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "permissions", :force => true do |t|
    t.string   "permissiontype"
    t.string   "description"
    t.integer  "bits"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "researchareas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "residencies", :force => true do |t|
    t.integer  "specialty_id"
    t.string   "location"
    t.string   "trainingtitle"
    t.string   "matchconnection"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "affiliate_id"
  end

  create_table "states", :force => true do |t|
    t.string   "state"
    t.string   "abbreviation"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sysdiagrams", :primary_key => "diagram_id", :force => true do |t|
    t.string  "name",         :limit => 128, :null => false
    t.integer "principal_id",                :null => false
    t.integer "version"
    t.binary  "definition"
  end

  add_index "sysdiagrams", ["principal_id", "name"], :name => "UK_principal_name", :unique => true

  create_table "userpermissions", :force => true do |t|
    t.integer  "userid"
    t.integer  "permissionid"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.integer  "usertype_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usertypes", :force => true do |t|
    t.string   "usertype"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
