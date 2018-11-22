unit modify_card;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons,StrUtils;

type
  TForm_modify_card = class(TForm)
    Label_empcode_cx: TLabel;
    Label_cardtime1_cx: TLabel;
    Label_empname_cx: TLabel;
    Label_cardtime2_xg: TLabel;
    MaskEdit_modify_cardtime: TMaskEdit;
    BitBtn_cardxg: TBitBtn;
    BitBtn_cardqx: TBitBtn;
    cx_empcode: TLabel;
    cx_empname: TLabel;
    cx_empcardtime: TLabel;
    BitBtn_cardadd: TButton;
    procedure BitBtn_cardxgClick(Sender: TObject);
    procedure BitBtn_cardqxClick(Sender: TObject);
    procedure BitBtn_cardaddClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_modify_card: TForm_modify_card;

implementation

uses UDM, MainU;


{$R *.dfm}



procedure TForm_modify_card.BitBtn_cardxgClick(Sender: TObject);
var
modify_card_time :TDateTime;
DateTime,MyDate,MyTime : TDateTime;
DateStr,TimeStr:string;
begin
 if MaskEdit_modify_cardtime.Text='    -  -     :  :  ' then
begin
showmessage('时间为空');
end ;
if MaskEdit_modify_cardtime.Text<>'    -  -     :  :  ' then
begin
  try
   modify_card_time:=strtodatetime(MaskEdit_modify_cardtime.Text)
   except
        ShowMessage('格式不正确，请输入正确的日期时间');
     end;
     // showmessage('时间格式正确33');
       // modify_card_time:= MyDate + MyTime;
       // showmessage(MaskEdit_modify_cardtime.Text);
       // showmessage('开始修改33');

       if   modify_card_time<>strtodatetime('1899-12-30 00:00:00') then
       begin
       ShowMessage('最后的时间是'+datetimetostr(modify_card_time));
       //开始更新
       dm.ADOupdate_cx.SQL.Clear;
       dm.ADOupdate_cx.SQL.Text:='exec dbo.sp_ADOupdate_cx'+' '+
       quotedstr(leftstr(main_form.ComboBox1.Text,2))+' , '+
       trim(quotedstr(cx_empcode.Caption))+', '+
       quotedstr(cx_empcardtime.Caption)+' , '+
       quotedstr(maskedit_modify_cardtime.EditText);
       try
       dm.ADOupdate_cx.ExecSQL;
   //DM.ADODataSet_cx.Locate(dm.ADODataSet_cx.IndexFieldNames,dm.ADODataSet_cx.f)
   //locate('yourfield','要定位的值',[])
  //Form_modify_card:=Form_modify_card.Create(nil);
  //aSQLClientDataSet.Locate('City;District', VarArrayOf(['台北,大安区']),[]);
       Form_modify_card.Close;
    //刷新
       //dm.ADODataSet_cx.Lookup()
       dm.ADODataSet_cx.Active:=false;
      dm.ADODataSet_cx.Active:=true;
      main_form.label_count1.Caption:=inttostr(dm.DataSource_cx.DataSet.RecordCount);
       //dm.ADODataSet_cx.DataSource.DataSet) )
    dm.ADODataSet_cx.Locate('工号;打卡时间',VarArrayOf([cx_empcode.Caption,maskedit_modify_cardtime.EditText]),[]);
     //exec dbo.sp_ADOupdate_cx 04 , '80411     ' , '2011-04-14 12:07:16' , '2011-04-14 12:47:16'
    // showmessage('重定位完成');
      //dmclient.ClientDataSet1.Locate('姓名;性别;年龄',VarArrayOf([trim(edit2.Text),trim(ComboBox1.Text),trim(edit2.Text)]),[])
        except
       showmessage('数据修改失败，请重新修改'); 
       end;

       end ;
       if   modify_card_time=strtodatetime('1899-12-30 00:00:00') then
       begin
       ShowMessage('请重新输入时间');
       end;

end;

end;



procedure TForm_modify_card.BitBtn_cardaddClick(Sender: TObject);
var
modify_card_time :TDateTime;
DateTime,MyDate,MyTime : TDateTime;
DateStr,TimeStr:string;
begin
 if MaskEdit_modify_cardtime.Text='    -  -     :  :  ' then
begin
showmessage('时间为空');
end ;
if MaskEdit_modify_cardtime.Text<>'    -  -     :  :  ' then
begin
  try
   modify_card_time:=strtodatetime(MaskEdit_modify_cardtime.Text)
   except
        ShowMessage('格式不正确，请输入正确的日期时间');
     end;
     // showmessage('时间格式正确33');
       // modify_card_time:= MyDate + MyTime;
       // showmessage(MaskEdit_modify_cardtime.Text);
       // showmessage('开始修改33');

       if   modify_card_time<>strtodatetime('1899-12-30 00:00:00') then
       begin
       ShowMessage('补卡的时间是'+datetimetostr(modify_card_time));
       //开始更新
       dm.ADOupdate_cx.SQL.Clear;
       dm.ADOupdate_cx.SQL.Text:='exec dbo.sp_ADOupdate_cx_addcard'+' '+
       quotedstr(leftstr(main_form.ComboBox1.Text,2))+' , '+
       trim(quotedstr(cx_empcode.Caption))+', '+
       //quotedstr(cx_empcardtime.Caption)+' , '+
       quotedstr(maskedit_modify_cardtime.EditText);
       try
       dm.ADOupdate_cx.ExecSQL;
   //DM.ADODataSet_cx.Locate(dm.ADODataSet_cx.IndexFieldNames,dm.ADODataSet_cx.f)
   //locate('yourfield','要定位的值',[])
  //Form_modify_card:=Form_modify_card.Create(nil);
  //aSQLClientDataSet.Locate('City;District', VarArrayOf(['台北,大安区']),[]);
       Form_modify_card.Close;
    //刷新
       //dm.ADODataSet_cx.Lookup()
       dm.ADODataSet_cx.Active:=false;
      dm.ADODataSet_cx.Active:=true;
      main_form.label_count1.Caption:=inttostr(dm.DataSource_cx.DataSet.RecordCount);
       //dm.ADODataSet_cx.DataSource.DataSet) )
    dm.ADODataSet_cx.Locate('工号;打卡时间',VarArrayOf([cx_empcode.Caption,maskedit_modify_cardtime.EditText]),[]);
     //exec dbo.sp_ADOupdate_cx 04 , '80411     ' , '2011-04-14 12:07:16' , '2011-04-14 12:47:16'
    // showmessage('重定位完成');
      //dmclient.ClientDataSet1.Locate('姓名;性别;年龄',VarArrayOf([trim(edit2.Text),trim(ComboBox1.Text),trim(edit2.Text)]),[])
        except
       showmessage('数据添加失败，请重新修改'); 
       end;

       end ;
       if   modify_card_time=strtodatetime('1899-12-30 00:00:00') then
       begin
       ShowMessage('请重新输入时间');
       end;

end;

end;


procedure TForm_modify_card.BitBtn_cardqxClick(Sender: TObject);
begin
Form_modify_card.Close;
end;

end.
