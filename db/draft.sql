/*
 Create public and private schemas
 Create admin, server, user and anon roles


-- User
-- Group
-- Discussion
-- Document
-- Reaction
-- Stance
-- Poll
-- Outcome

*/

create table if not exists lg_private.user_account (
  id uuid default gen_random_uuid() primary key,
  email citext unique not null,
  email_confirmed boolean not null default false,

);
CREATE TABLE public.users (
    id integer NOT NULL,
    email public.citext,
    encrypted_password character varying(128) DEFAULT ''::character varying,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(255),
    deactivated_at timestamp without time zone,
    is_admin boolean DEFAULT false,
    avatar_kind character varying(255) DEFAULT 'initials'::character varying NOT NULL,
    uploaded_avatar_file_name character varying(255),
    uploaded_avatar_content_type character varying(255),
    uploaded_avatar_file_size integer,
    uploaded_avatar_updated_at timestamp without time zone,
    avatar_initials character varying(255),
    username character varying(255),
    email_when_proposal_closing_soon boolean DEFAULT false NOT NULL,
    authentication_token character varying(255),
    unsubscribe_token character varying(255),
    memberships_count integer DEFAULT 0 NOT NULL,
    uses_markdown boolean DEFAULT false NOT NULL,
    selected_locale character varying(255),
    time_zone character varying(255),
    key character varying(255),
    detected_locale character varying(255),
    email_catch_up boolean DEFAULT true NOT NULL,
    email_api_key character varying(255),
    email_when_mentioned boolean DEFAULT true NOT NULL,
    email_on_participation boolean DEFAULT false NOT NULL,
    default_membership_volume integer DEFAULT 2 NOT NULL,
    country character varying,
    region character varying,
    city character varying,
    experiences jsonb DEFAULT '{}'::jsonb NOT NULL,
    facebook_community_id integer,
    slack_community_id integer,
    remember_token character varying,
    short_bio character varying DEFAULT ''::character varying NOT NULL,
    email_verified boolean DEFAULT false NOT NULL,
    location character varying DEFAULT ''::character varying NOT NULL,
    last_seen_at timestamp without time zone,
    legal_accepted_at timestamp without time zone,
    email_newsletter boolean DEFAULT false NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    short_bio_format character varying(10) DEFAULT 'md'::character varying NOT NULL,
    attachments jsonb DEFAULT '[]'::jsonb NOT NULL,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    secret_token character varying DEFAULT public.gen_random_uuid(),
    content_locale character varying,
    bot boolean DEFAULT false NOT NULL,
    link_previews jsonb DEFAULT '[]'::jsonb NOT NULL,
    email_catch_up_day integer,
    date_time_pref character varying
);
