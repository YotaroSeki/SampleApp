const gravatar_for = (user, tag, options = {size: 80}) => {
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    size = options.size;
    gravatar_url = 'https://secure.gravatar.com/avatar/' + gravatar_id + '?s=' + size;
    const gravatar = document.createElement('img');
    gravatar.setAttribute('src', gravatar_url);
    gravatar.setAttribute('alt', user.name);
    gravatar.setAttribute('class', 'gravatar');
    tag.appendChild(gravatar);
}

module.except = gravatar_for
