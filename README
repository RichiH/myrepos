myrepos, a tool to manage all your version control repos

You have a lot of version control repositories. Sometimes you want to
update them all at once. Or push out all your local changes. You use
special command lines in some repositories to implement specific workflows.
Myrepos provides a `mr` command, which is a tool to manage all your version
control repositories.

It supports git, svn, mercurial, bzr, darcs, cvs, fossil and veracity.

Author: Joey Hess
Homepage: https://myrepos.branchable.com/

The mr command is intended to be very self-contained, since it might be
useful to check it into ~/bin when keeping your home in version control. It
has no dependencies aside from basic perl. (The included webcheckout
command has more dependencies, specifically the LWP::Simple and
HTML::Parser CPAN modules, and optionally the URI module.)

To install mr, just copy mr into your PATH somewhere.

To get started using mr, perhaps you already have some checked out
repositories. Go into each one and run "mr register". Now mr has
a list of them in ~/.mrconfig, which you can edit later to tune its
operation.

Suppose you've cd'd to ~/src, and it has many repositories under it.
To update them all, run "mr update". To commit any pending changes in
each, run "mr commit". To check the status of each, you could run
"mr status".

For further details, and lots of configuration options, see the mr(1) man
page or the website, https://myrepos.branchable.com/
