class UserMailer < ActionMailer::Base
  default from: "cengasrle@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user # for access in the view

    mail to: user.email, subject: "Signup confirmation from restaurants.ba"
    #mail method will generate the message and vratit ce je
    # to: =>email address submited via form, but mailer doesnt have access to request parametres
    # Pa ce metoda signup_confirmation primati instancu usera


    # EH STO NE DOLAZI PORUKA?
    # RAILS will silently ignore errors while trying to sent email
    # Zato nisi vidio error, a user registrovana bez greski

    # development.rb
    # Don't care if the mailer can't send.
    # config.action_mailer.raise_delivery_errors = false, stavi na true
    # Sada ces dobiti exception

    # I onda dobijes slijedeci excpetion:
    # No connection could be made because the target machine actively refused it. - connect(2)
    # U Prevodu, halo ba ne mogu da se konektujem na SMTP Server, sto je tebi trenutno localhost

    # Opet ides u development.rb
    # Change mail delvery to either :smtp, :sendmail, :file, :test
    # config.action_mailer.delivery_method = :smtp

    #config.action_mailer.smtp_settings = {
      #address: "smtp.gmail.com",
      #port: 587,
      #domain: "railscasts.com",
      #authentication: "plain",
      #enable_starttls_auto: true,
      #user_name: ENV["GMAIL_USERNAME"],
      #password: ENV["GMAIL_PASSWORD"]
    #}

    # Environment varijable... smjestaju se "outside_of_the_code" i naravno ne na repozitorij, gdje ih smjestas?
    # Postoji vise nacina, jedan je da ih drzis u aplikaciji(njenoj folder-strukturi)
    # Dodaj fajl u config/application.yml
    # U tom fajlu mozes najnormalnije napisati
    # GMAIL_USERNAME: "cengasrle"
    # GMAIL_PASSWORD: "blablablabla", ali moras biti siguran da nisu na repozitoriju (jer je to privatni "settings aplikacije")
    # Iz putanje projekta(cmd): echo /config/application.yml >> .gitignore
    # Onda provjeri u root-u projekta fajl .gitignore da li postoji /config/application.yml kao zadnji dodani
    # Kako sada loadas ovu konfiguraciju u aplikaciju? application.rb (mjesto gdje je framework "loaded in")
    # Uvijek je ENV varijabla string
  end
end
