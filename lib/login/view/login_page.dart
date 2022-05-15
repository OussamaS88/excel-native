import 'package:excel_native/services/auth/auth_service.dart';
import 'package:excel_native/utilities/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LoginBloc(context.read<AuthService>()),
        child: const LoginPageBody(),
      );
  }
}

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isSubmissionFailure) {
          showErrorDialog(
              context, state.errorMessage ?? "An unknown error has occurred.");
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 350,
                        child: Text(
                            "Login with your registered email and password."),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      child: Column(
                        children: const [
                          _EmailInput(),
                          _PasswordInput(),
                          _LoginButton(),
                          SizedBox(
                            height: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          initialValue: "test@mail.com",
          onChanged: (email) =>
              context.read<LoginBloc>().add(LoginEmailChanged(email: email)),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email address...',
            helperText: '',
            errorText: state.email.invalid ? 'Invalid email.' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          initialValue: "password123",
          onChanged: (password) => context
              .read<LoginBloc>()
              .add(LoginPasswordChanged(password: password)),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password...',
            helperText: '',
            errorText: state.password.invalid ? 'Invalid password.' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      // buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(
                      60), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: state.status.isValidated
                    ? () => context.read<LoginBloc>().add(const LoginTapped())
                    : null,
                child: const Text("Login"),
              );
      },
    );
  }
}
