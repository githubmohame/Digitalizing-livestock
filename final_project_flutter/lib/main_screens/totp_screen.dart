import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/custome_secure_storage.dart';
import 'package:final_project_year/common_component/custome_stackbar.dart';
import 'package:final_project_year/common_component/custome_text_field.dart';
import 'package:final_project_year/main_screens/farmer_screen.dart';
import 'package:flutter/material.dart';

class TotpScreen extends StatelessWidget {
  TotpScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BackgroundScreen(
        child: LayoutBuilder(builder: (context, constraint) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: constraint.maxWidth < 900
                ? AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: const Text(
                      "totp code ادخل",
                      style: TextStyle(color: Colors.white),
                    ))
                : null //, drawer: MainDrawer(index: 4)
            ,
            body: Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: constraint.maxWidth > 900 ? 500 : null,
                  height: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //constraint.maxWidth>900?Container(height: 100, child: ComputerDrawer(index:4)):Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Card(
                              color: const Color(0xFF357515),
                              elevation: 20,
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                child: Form(
                                    child: Column(
                                  children: [
                                    const Icon(Icons.person,
                                        color: Colors.white, size: 50),
                                    const SizedBox(height: 20),
                                    Builder(builder: (context) {
                                      return CustomeTextField(texthint:  'اكتب كود totp',
                                        keyboardType: TextInputType.text,
                                        inputFormatters: [],
                                        validator: (p0) {
                                          return null;
                                        },
                                        controller: _controller,
                                      );
                                    }),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 70,
                                      child: TextButton(
                                          onPressed: () async {
                                            CustomeSecureStorage.settotp(
                                                totp: _controller.text);
                                            if((await   Api.check_totp_api())){
                                                 Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return FarmerScreen();
                                              },
                                            ));
                                            }
                                          
                                            
                                           
                                          },
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.zero,
                                                      side: BorderSide(
                                                          color: Colors
                                                              .transparent))),
                                              backgroundColor:
                                                  MaterialStateProperty.resolveWith(
                                                      (states) => Colors.green),
                                              side: MaterialStateProperty.resolveWith(
                                                  (states) => const BorderSide(
                                                      color: Colors.green,
                                                      style:
                                                          BorderStyle.solid))),
                                          child: const Text('استكمال', style: TextStyle(color: Colors.white))),
                                    ),
                                    SizedBox(
                                      height: 70,
                                      child: TextButton(
                                          onPressed: () async {
                                             Map m = {};
                                             if ((m = (await Api
                                                      .send_email_totp()))
                                                  .containsKey("message")) {
                                         
                                              } else {
                                                showSnackbarerror(
                                                    context: context,
                                                    text: m["error"]);
                                              }

                                           
                                          },
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.zero,
                                                      side: BorderSide(
                                                          color: Colors
                                                              .transparent))),
                                              backgroundColor:
                                                  MaterialStateProperty.resolveWith(
                                                      (states) => Colors.green),
                                              side: MaterialStateProperty.resolveWith(
                                                  (states) => const BorderSide(
                                                      color: Colors.green,
                                                      style:
                                                          BorderStyle.solid))),
                                          child: const Text('اعادة ارسال', style: TextStyle(color: Colors.white))),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
//(await Api.send_email_totp())
/*

 if ((m = (await Api
                                                      .send_email_totp()))
                                                  .containsKey("message")) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TotpScreen(),
                                                    ));
                                              } else {
                                                showSnackbarerror(
                                                    context: context,
                                                    text: m["error"]);
                                              }


*/