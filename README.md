# Intelligent Individual Finance (IIF v2)

Hello everyone, that's my pet-project made in cooperation with my friend (not a programmer) - Victor N. who is an economist by vocation and of education.

The main goal of this app - is to provide a convenient way to deal with personal budget (internal use only, no plans to sell it).

Currently, the work is in progress, we meet from time to time, share our ideas and try to implement them to make us (and our personal budgets) happy:)

**Features:**
- [x] several types of accounts (money, credit cards, debts)
- [x] initial input, income, expense, debts operations
- [x] support for account objects - things to build future analytics on them
- [ ] edit of operations
- [ ] currencies
- [ ] table/chart analytics
- [ ] 'investment' accounts

# Some screens of the app
![Screenshots](screenshots/sc.png)

# Some (not)boring programmer stuff

The app is build with layered architecture pattern in mind [Reso Coder's TDD + Clean](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure).

**Domain** and **data** layers are written using TDD style.

**Presentation** layer is build on BLoCs, thanks to the [flutter_bloc package](https://pub.dev/packages/flutter_bloc)

Data is now stored in simple json. It is hard to keep consistent and this part will be refactored further to the **sqlite**. To be true, this is done  for simplifying things on the first stage and for changing this on next stages..
