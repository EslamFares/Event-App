import 'package:event_app_ui/models/data_model.dart';

List<DataModel> getDates(){
List<DataModel> dates =new List<DataModel>();
DataModel dateModel = new DataModel();
//1
dateModel.date='10';
dateModel.weekDay='Sun';
dates.add(dateModel);
dateModel=new DataModel();

//2
  dateModel.date='11';
  dateModel.weekDay='Mon';
  dates.add(dateModel);
  dateModel=new DataModel();

//3
  dateModel.date='12';
  dateModel.weekDay='Tue';
  dates.add(dateModel);
  dateModel=new DataModel();

//4
  dateModel.date='13';
  dateModel.weekDay='Wed';
  dates.add(dateModel);
  dateModel=new DataModel();

//5
  dateModel.date='14';
  dateModel.weekDay='Thu';
  dates.add(dateModel);
  dateModel=new DataModel();

//6
  dateModel.date='15';
  dateModel.weekDay='Fri';
  dates.add(dateModel);
  dateModel=new DataModel();

//7
  dateModel.date='16';
  dateModel.weekDay='Sat';
  dates.add(dateModel);
  dateModel=new DataModel();

  return dates;

}