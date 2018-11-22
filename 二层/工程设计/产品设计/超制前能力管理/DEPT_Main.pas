unit DEPT_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, ComCtrls, Menus, Buttons, StdCtrls,
  OleServer, Excel2000,ComObj,ClipBrd, ExtCtrls, DBCtrls, Mask, dbcgrids;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    Add: TMenuItem;
    Edit: TMenuItem;
    Delete: TMenuItem;
    ADOTable1INST_CODE: TStringField;
    Label1: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    ADOTable1PROD_ROUT_INST: TMemoField;
    Panel2: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Label5: TLabel;
    DBMemo2: TDBMemo;
    Label6: TLabel;
    DBMemo3: TDBMemo;
    procedure DeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure EditClick(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  //  procedure DBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses common, DEPT_Add, DEPT_Edit;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);

begin
if not app_init(self.ADOConnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
 end;
  self.caption:=application.Title;
end;

procedure TForm1.DeleteClick(Sender: TObject);
begin

 if ADOQuery1.Active then
  ADOQuery1.Close;
   ADOQuery1.Parameters.ParamValues['INST_CODE'] := self.ADOTable1INST_CODE.Value ;
  if MessageDlg('你确定要删除这条记录吗？',mtConfirmation,[mbyes,mbno],0)=mryes then
   ADOQuery1.ExecSQL ;
 ADOTable1.Close;
 ADOTable1.Open;

end;

procedure TForm1.ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
    if pos('Data0036',E.Message)>0 then
      MessageDlg('不能删除该记录',mtwarning,[mbOk],0);
    Abort;
end;

procedure TForm1.EditClick(Sender: TObject);
begin
  if not AdoTable1.IsEmpty then
  begin
  if ADOQuery2.Active then
    ADOQuery2.Close;
    ADOQuery2.Parameters.ParamValues['INST_CODE'] := self.ADOTable1INST_CODE.Value ;
    ADOQuery2.Open;
    ADOQuery2.Edit;
    Form1.Hide;
    Form2:=TForm2.Create(Application);
    Form2.ShowModal;
    Form2.Free;
    ADOTable1.Close;
    ADOTable1.Open;
  end;
end;

procedure TForm1.AddClick(Sender: TObject);
var
  bookmark: TBookMark;
begin
  ADOTable1.Close;
  ADOTable1.ReadOnly:=false;
  ADOTable1.Open;
  Form3:=TForm3.Create(Application);
  Bookmark:=AdoTable1.GetBookmark();
  Form1.Hide;
  AdoTable1.Append;
  AdoTable1.FieldValues['INST_CODE']:='';
  AdoTable1.FieldValues['PROD_ROUT_INST']:='';
  if Form3.ShowModal<>mrok then
   AdoTable1.GotoBookmark(bookmark);
  Form3.Free;
  AdoTable1.FreeBookmark(bookmark);
  ADOTable1.Close;
  ADOTable1.ReadOnly:=true;
  ADOTable1.Open;


end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if RadioButton1.Checked=true then
 begin

  if trim(Edit1.Text)<>'' then
  begin
    AdoTable1.Filter:='INST_CODE like ''%'+Trim(Edit1.Text)+'%'''
  end
 else
    AdoTable1.Filter:='';
 end
 else
 if RadioButton2.Checked=true then
 begin
  if trim(Edit1.Text)<>'' then
    AdoTable1.Filter:='PROD_ROUT_INST like ''%'+Trim(Edit1.Text)+'%'''
 else
    AdoTable1.Filter:='';
 end;


end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  application.Terminate;
  close;
end;

procedure TForm1.DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and (DBCtrlGrid1.PanelCount>ADOTable1.RecordCount-2)  then
  abort;
   //如果是下箭头如果是最后一条记录
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  label1.Caption:='内容';
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  label1.Caption:='备注代码';
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
   AdoTable1.Open;
end;

end.
