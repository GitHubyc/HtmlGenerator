package com.xakj;

import com.xakj.util.CodeGenerateUtils;

public class Application {

	public static void main(String[] args) {
		try {
//			String tableName = "T_BOOK";// 表名
//			String tableAnnotation = "书籍";// 描述
//			String modelName = "Book";// 生成Model名称
//			String author = "袁文彪";// 作者
//			CodeGenerateUtils codeGenerateUtils = new CodeGenerateUtils();
//			codeGenerateUtils.generate(tableName, modelName, tableAnnotation,
//					author);

//			String tableName = "T_THING";// 表名
//			String tableAnnotation = "事";// 描述
//			String modelName = "Thing";// 生成Model名称
//			String author = "袁文彪";// 作者
//			CodeGenerateUtils codeGenerateUtils = new CodeGenerateUtils();
//			codeGenerateUtils.generate(tableName, modelName, tableAnnotation,
//					author);

//			String tableName = "T_PERSONNEL";// 表名
//			String tableAnnotation = "人";// 描述
//			String modelName = "Personnel";// 生成Model名称
//			String author = "袁文彪";// 作者
//			CodeGenerateUtils codeGenerateUtils = new CodeGenerateUtils();
//			codeGenerateUtils.generate(tableName, modelName, tableAnnotation,
//					author);

//			String tableName = "T_SETUP";// 表名
//			String tableAnnotation = "体制";// 描述
//			String modelName = "Setup";// 生成Model名称
//			String author = "袁文彪";// 作者
//			CodeGenerateUtils codeGenerateUtils = new CodeGenerateUtils();
//			codeGenerateUtils.generate(tableName, modelName, tableAnnotation,
//					author);

//			String tableName = "T_SUBSTANCE";// 表名
//			String tableAnnotation = "物";// 描述
//			String modelName = "Substance";// 生成Model名称
//			String author = "袁文彪";// 作者
//			CodeGenerateUtils codeGenerateUtils = new CodeGenerateUtils();
//			codeGenerateUtils.generate(tableName, modelName, tableAnnotation,
//					author);

//			String tableName = "T_DIARY";// 表名
//			String tableAnnotation = "日记";// 描述
//			String modelName = "Diary";// 生成Model名称
//			String author = "袁文彪";// 作者
//			CodeGenerateUtils codeGenerateUtils = new CodeGenerateUtils();
//			codeGenerateUtils.generate(tableName, modelName, tableAnnotation,
//					author);

//			String tableName = "T_RHESIS";// 表名
//			String tableAnnotation = "名句";// 描述
//			String modelName = "Rhesis";// 生成Model名称
//			String author = "袁文彪";// 作者
//			CodeGenerateUtils codeGenerateUtils = new CodeGenerateUtils();
//			codeGenerateUtils.generate(tableName, modelName, tableAnnotation,
//					author);

			String tableName = "T_POEMS_WORDS";// 表名
			String tableAnnotation = "诗词文章";// 描述
			String modelName = "PoemsWords";// 生成Model名称
			String author = "袁文彪";// 作者
			CodeGenerateUtils codeGenerateUtils = new CodeGenerateUtils();
			codeGenerateUtils.generate(tableName, modelName, tableAnnotation,
					author);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
