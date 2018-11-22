unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, ComCtrls, StdCtrls, Buttons,
  ToolWin, Mask, DBCtrls, Menus, ADODB;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Bar1: TStatusBar;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    PopupMenu1: TPopupMenu;
    add: TMenuItem;
    edit: TMenuItem;
    copydate: TMenuItem;
    delete: TMenuItem;
    ADOTable1: TADOTable;
    ADOTable1RKEY: TAutoIncField;
    ADOTable1CURR_CODE: TStringField;
    ADOTable1CURR_NAME: TStringField;
    ADOTable1EXCH_RATE: TFloatField;
    ADOTable1TDATE: TDateTimeField;
    ADOTable1TREADONLY: TIntegerField;
    ADOTable1BASE_TO_OTHER: TFloatField;
    ADOTable1exch1: TStringField;
    ADOTable1exch2: TStringField;
    ADOConnection1: TADOConnection;
    ADOTable1QUOTE_BASED: TWordField;
    ADOTable1QTE_EXCH_RATE: TFloatField;
    ADOTable1QTE_BASE_TO_OTHER: TFloatField;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure Table1AfterDelete(DataSet: TDataSet);
    procedure Table1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure Table1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure copydateClick(Sender: TObject);
    procedure ADOTable1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADOTable1AfterDelete(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses editcurrency,common;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
Application.Terminate;
close;
end;

procedure TForm1.editClick(Sender: TObject);
begin
 adotable1.Edit;
 form2.DBEdit1.SelectAll;
 form2.MaskEdit1.Text:=formatDateTime('yyyy-mm-dd',adotable1tdate.Value);
 form2.showmodal;
end;

procedure TForm1.addClick(Sender: TObject);
begin
 adotable1.Append;
 form2.MaskEdit1.Text:= datetostr(date());
 form2.Edit1.Text:='0.00000000';
 form2.Edit2.Text:='0.00000000';
 form2.Edit4.Text:='0.00000000';
 form2.Edit5.Text:='0.00000000';
 form2.Edit3.Text:='';
 form2.showmodal;
end;

procedure TForm1.deleteClick(Sender: TObject);
begin
if adotable1rkey.Value=1 then
 begin
  messagedlg('本位币不能删除！',mtinformation,[mbok],0);
 end
else
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 adotable1.Delete;
end;

procedure TForm1.Table1AfterDelete(DataSet: TDataSet);
begin
   messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TForm1.Table1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
IF (E is EDBEngineError) then
 if (E as EDBEngineError).Errors[0].ErrorCode=9729 then
 begin
  messagedlg('此条记录有关系到客户数据！！',mtWarning,[mbOk],0);
  Abort;
 end;
end;

procedure TForm1.Table1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
IF (E is EDBEngineError) then
 if (E as EDBEngineError).Errors[0].ErrorCode=9729 then
 begin
  messagedlg('货币代码重复,请重新输入',mtWarning,[mbOk],0);
  Abort;
 end;
end;

procedure TForm1.copydateClick(Sender: TObject);
var
v_currname:string;
begin
v_currname:=adotable1.FieldValues['curr_name'];
form2.edit1.Text:=format('%.8f',[adotable1.fieldbyname('exch_rate').asfloat]);
form2.edit2.Text:=format('%.8f',[adotable1.fieldbyname('base_to_other').asfloat]);
form2.edit4.Text:=format('%.8f',[ADOTable1QTE_EXCH_RATE.Value]);
form2.edit5.Text:=format('%.8f',[ADOTable1QTE_BASE_TO_OTHER.Value]);

adotable1.Append;
form2.MaskEdit1.Text:= FormatDateTime('yyyy-mm-dd',date());
form2.Edit3.Text:=v_currname;
 form2.showmodal;
end;

procedure TForm1.ADOTable1CalcFields(DataSet: TDataSet);
begin

adotable1.FieldByName('exch1').AsString:=
   adotable1.FieldValues['curr_code']+'/本位币';
adotable1.FieldByName('exch2').AsString:=
   '本位币/'+adotable1.FieldValues['curr_code'];

end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey];
 if Key = Chr(vk_Back) then       //如果按下了backspace
  begin
   if length(bar1.SimpleText)>5 then
    bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
   if length(bar1.SimpleText)>5 then
    Adotable1.Locate('curr_code',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption)
   else
    adotable1.First
   end
  else
   if key=chr(vk_return) then    //如果按下了enter
     editClick(sender)           //调用编辑命令
    ELSE
     begin
      bar1.SimpleText :=bar1.SimpleText+key;
      Adotable1.Locate('curr_code',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
     end;
end;

procedure TForm1.ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('数量删除失败,该记录被其它表使用!',mtinformation,[mbok],0);
 abort;
end;

procedure TForm1.ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('数据保存失败!请检查编号是否重复!',mtinformation,[mbok],0);
 abort;
end;

procedure TForm1.ADOTable1AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数据被成功删!',mtinformation,[mbok],0);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 if  Adoconnection1.Connected then
  begin
   self.ADOTable1.Open;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
  if not App_Init_2(self.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;

 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if adotable1.IsEmpty then
  begin
   edit.Enabled:=false;
   copydate.Enabled:=false;
   delete.Enabled:=false;
  end
 else
  begin
   edit.Enabled:=true;
   copydate.Enabled:=true;
   delete.Enabled:=true;
  end;
end;

end.
