class FollowToggle {
    constructor(el) {
        this.userId = el.data.userId;
        this.followState = el.data.followState;
        this.$el = $(el);
        this.render();

        this.handleClick(e)
            .then
    }

    render() {
        if (btn.followState === 'followed') {
            btn.innerText = 'Follow!';
        } else {
            btn.innerText = 'Unfollow!';
        }
    }

    handleClick(e) {
        e.preventDefault();
        if (this.followState === 'unfollowed') {
            return $.ajax({
                method: 'POST',
                url: `users/${this.userId}/follow`,
                dataType: '$.ajax',
            });
        } else {
            return $.ajax({
                method: 'DELETE',
                url: `users/${this.userId}/follow`,
                dataType: '$.ajax',
            });
        }

    }

}

module.exports = FollowToggle;