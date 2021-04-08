// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.




import 'package:logging/logging.dart';

abstract class LoggerType {
  Logger get logger;
}

extension LoggerSpawner  on LoggerType{
  Logger newLogger(String name) => Logger('${logger.fullName}.$name');

  
}