// login_register_page.dart
import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  bool _obscurePass = true;
  bool _obscureConfirm = true;

  // 0 = تسجيل دخول | 1 = إنشاء حساب | 2 = نسيت كلمة المرور
  int _mode = 0;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    switch (_mode) {
      case 0: // Login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ مرحباً ${_emailCtrl.text.split('@').first}'),
          ),
        );
        break;
      case 1: // Register
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('✅ تم إنشاء الحساب بنجاح')),
        );
        break;
      case 2: // Reset
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('📧 رابط إعادة التعيين أُرسل إلى بريدك'),
          ),
        );
        break;
    }
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  // مساعدة سريعة لنصّ العنوان
  String get _title {
    switch (_mode) {
      case 0:
        return 'تسجيل الدخول';
      case 1:
        return 'إنشاء حساب جديد';
      case 2:
        return 'إعادة تعيين كلمة المرور';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        backgroundColor: const Color(0xff006633),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // الأيقونة
                  Icon(
                    _mode == 1 ? Icons.person_add : Icons.account_circle,
                    size: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16),

                  // البريد
                  TextFormField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => val == null || !val.contains('@')
                        ? 'أدخل بريداً صالحاً'
                        : null,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: 'البريد الإلكتروني',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // كلمة المرور (لا تظهر في وضع Reset)
                  if (_mode != 2) ...[
                    TextFormField(
                      controller: _passCtrl,
                      obscureText: _obscurePass,
                      validator: (val) => val == null || val.length < 6
                          ? '6 أحرف على الأقل'
                          : null,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        labelText: 'كلمة المرور',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePass
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () =>
                              setState(() => _obscurePass = !_obscurePass),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // تأكيد كلمة المرور (تظهر فقط في وضع إنشاء الحساب)
                  if (_mode == 1) ...[
                    TextFormField(
                      controller: _confirmCtrl,
                      obscureText: _obscureConfirm,
                      validator: (val) => val != _passCtrl.text
                          ? 'كلمتا المرور غير متطابقتين'
                          : null,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        labelText: 'تأكيد كلمة المرور',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirm
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () => setState(
                            () => _obscureConfirm = !_obscureConfirm,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // روابط التنقل بين الأوضاع
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_mode != 2)
                        TextButton(
                          onPressed: () => setState(() => _mode = 2),
                          child: const Text('نسيت كلمة المرور؟'),
                        ),
                      TextButton(
                        onPressed: () => setState(() {
                          _mode = _mode == 0 ? 1 : 0;
                          _confirmCtrl.clear();
                        }),
                        child: Text(
                          _mode == 0 ? 'إنشاء حساب' : 'لدي حساب بالفعل',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // زر الإرسال
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _submit,
                      child: Text(
                        _mode == 0
                            ? 'تسجيل الدخول'
                            : _mode == 1
                            ? 'إنشاء الحساب'
                            : 'إرسال رابط التعيين',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
