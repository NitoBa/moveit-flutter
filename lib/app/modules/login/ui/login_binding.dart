import 'package:get/get.dart';
import 'package:moveitflutter/app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:moveitflutter/app/modules/login/domain/usecases/login_usecase.dart';
import 'package:moveitflutter/app/modules/login/external/datasource/login_datasource_impl.dart';
import 'package:moveitflutter/app/modules/login/infra/datasource/i_login_datasource.dart';
import 'package:moveitflutter/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:moveitflutter/app/modules/login/ui/controllers/login_controller.dart';
import 'package:moveitflutter/app/modules/login/ui/controllers/register_controller.dart';
import 'package:moveitflutter/app/shared/hasura/custom_hasura.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginDatasourceImpl>(
      () => LoginDatasourceImpl(Get.find<CustomHasuraConnect>()),
    );
    Get.lazyPut<ILoginRepository>(
      () => LoginRepositoryImpl(Get.find<ILoginDatasource>()),
    );
    Get.lazyPut<ILoginUsecase>(
      () => LoginUsecase(Get.find<ILoginRepository>()),
    );
    Get.lazyPut(() => LoginController(Get.find<ILoginUsecase>()));
    Get.lazyPut(() => RegisterController());
  }
}
