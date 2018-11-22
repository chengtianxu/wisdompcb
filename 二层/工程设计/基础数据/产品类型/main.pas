unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DB, DBTables, Mask,
  DBCtrls, Menus, ADODB;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Bar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    new: TMenuItem;
    edit: TMenuItem;
    copydate: TMenuItem;
    delete: TMenuItem;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOTable1RKEY: TAutoIncField;
    ADOTable1PRODUCT_NAME: TStringField;
    ADOTable1PR_GRP_POINTER: TIntegerField;
    ADOTable1LEAD_TIME: TSmallintField;
    ADOTable1MAX_DAYS_EARLY_BUILD: TSmallintField;
    ADOTable1PROD_SEEDVALUE: TStringField;
    ADOTable1PROD_INCREMENTBY: TSmallintField;
    ADOTable1ANALYSIS_CODE1: TStringField;
    ADOTable1ANALYSIS_CODE2: TStringField;
    ADOTable1ANALYSIS_CODE3: TStringField;
    ADOTable1ANALYSIS_CODE4: TStringField;
    ADOTable1ANALYSIS_CODE5: TStringField;
    ADOTable07: TADOTable;
    ADOTable1grp_code: TStringField;
    ADOTable1grp_name: TStringField;
    ADOTable07RKEY: TAutoIncField;
    ADOTable07PR_GRP_CODE: TStringField;
    ADOTable07PRODUCT_GROUP_NAME: TStringField;
    ADOTable07PR_GRP_SEEDVALUE: TStringField;
    ADOTable07PR_GRP_INCREMENTBY: TSmallintField;
    ADOTable1PROD_CODE: TStringField;
    ADOTable1G_L_POINTER: TIntegerField;
    ADOTable1EST_SCRAP: TFloatField;
    ADOTable1EST_SCRAP1: TFloatField;
    ADOTable1EST_SCRAP_LTM: TFloatField;
    ADOTable1EST_SCRAP1_LMT: TFloatField;
    ADOTable1DG_ADJ_PTH: TBCDField;
    ADOTable1DG_ADJ_NPTH: TBCDField;
    ADOTable1batch_flag: TBooleanField;
    ADOTable1former_flag: TBooleanField;
    ADOTable1IESMODEL_PTR: TIntegerField;
    ADOTable1OPT_LOT_SIZE: TIntegerField;
    Edit1: TEdit;
    Label1: TLabel;
    ADOTable1layer_pre: TIntegerField;
    ADOTable1PRECHAR1: TStringField;
    ADOTable1PRECHAR2: TStringField;
    ADOTable1REVIEW_DAYS: TSmallintField;
    ADOTable1difficulty_grade: TIntegerField;
    BtnClose: TBitBtn;
    BtnBrush: TBitBtn;
    N1: TMenuItem;
    ADOTable1difficulty_grade_value: TFloatField;
    Button2: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure newClick(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure copydateClick(Sender: TObject);
    procedure ADOTable1AfterDelete(DataSet: TDataSet);
    procedure ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnBrushClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumn;
    field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

const
  ReviewDays=90;
var
  Form1: TForm1;

implementation

uses editprodcode,common;

{$R *.dfm}
procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm1.editClick(Sender: TObject);
begin
if not adotable1.IsEmpty then
 begin
  adotable1.Edit;
  hide;
  form2:=tform2.Create(application);
  form2.ShowModal;
  form2.Free;
 end;
end;

procedure TForm1.newClick(Sender: TObject);
begin
 adotable1.Append;
 hide;
 adotable1.FieldValues['lead_time']:=0;
 adotable1.FieldValues['opt_lot_size']:=0;
 adotable1.FieldValues['MAX_DAYS_EARLY_BUILD']:=0;
 adotable1.FieldValues['PROD_SEEDVALUE']:='1';
 //adotable1.FieldValues['PROD_INCREMENTBY']:=1;
 adotable1.FieldValues['REVIEW_DAYS']:=ReviewDays;
 form2:=tform2.Create(application);
 form2.ShowModal;
 form2.Free;
end;

procedure TForm1.deleteClick(Sender: TObject);
begin
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
   adotable1.Delete;
end;

procedure TForm1.copydateClick(Sender: TObject);
type
 a=array[0..28] of variant;
var
 v_recode:a;
 i:word;
begin
 for i:=0 to 28 do
  v_recode[i]:=adotable1.Fields[i+2].Value;
  adotable1.Append;
  for i:=0 to 28 do
  adotable1.fieldvalues[adotable1.Fields[i+2].FieldName]:=v_recode[i];
 self.Hide;
 form2:=tform2.Create(application);
 form2.ShowModal;
 form2.Free;
end;

procedure TForm1.ADOTable1AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TForm1.ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('数据保存失败请检查编号是否重复!',mtwarning,[mbok],0);
 abort;
end;

procedure TForm1.ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('不能删除该数据,已被其它数据所使用!',mtwarning,[mbok],0);
 abort;
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
   Adotable1.Locate('prod_code',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption)
  else
   adotable1.First
  end
else
 if key=chr(vk_return) then    //如果按下了enter
  editClick(sender)           //调用编辑命令
 ELSE
  begin
   bar1.SimpleText :=bar1.SimpleText+key;
   Adotable1.Locate('prod_code',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//  if self.ADOConnection1.Connected then
//    begin
//      rkey73:='3';
//      vprev:='4';
//     // showmessage('程序在开发模式下运行，请在发布前断开连接后编译！');
//    end
//  else
    if not app_init_2(ADOConnection1) then
      begin
        showmsg('程序起动失败,请联系管理员!',1);
        application.Terminate;
      end;
  self.caption:=application.Title;
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
  field_name := DBGrid1.Columns[0].FieldName;
  PreColumn := DBGrid1.Columns[0];  
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if Adoconnection1.Connected then
 begin
  if not self.ADOTable1.Active then
  begin
  adotable1.Open;
  adotable07.Open;
  end;
 end;
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

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  adotable1.IndexFieldNames:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  adotable1.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  adotable1.filter := '';
end;

procedure TForm1.BtnCloseClick(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.BtnBrushClick(Sender: TObject);
begin
ADOTable1.Close;
ADOTable1.Open;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if not adotable1.IsEmpty then
 begin
  //adotable1.Edit;
  hide;
  form2:=tform2.Create(application);
  form2.BitBtn1.Enabled:=false;
  form2.DBEdit12.ReadOnly:=true;
  form2.DBEdit13.ReadOnly:=true;
  form2.BitBtn3.Enabled:=false;
  form2.DBEdit7.Enabled:=false;
  form2.DBEdit8.Enabled:=false;
  form2.DBEdit9.Enabled:=false;
  form2.DBEdit20.Enabled:=false;
  form2.BitBtn6.Enabled:=false;
  form2.DBRadioGroup1.Enabled:=false;
  form2.DBEdit1.Enabled:=false;
  form2.DBEdit10.Enabled:=false;
  form2.DBEdit11.Enabled:=false;
  form2.DBEdit15.Enabled:=false;
  form2.DBEdit16.Enabled:=false;
  form2.DBEdit17.Enabled:=false;
  form2.DBEdit18.Enabled:=false;
  form2.DBEdit19.Enabled:=false;
  form2.BitBtn4.Enabled:=false;
  form2.BitBtn5.Enabled:=false;
  form2.Edit1.Enabled:=false;
  form2.Edit2.Enabled:=false;
  form2.DBEdit2.Enabled:=false;
  form2.DBEdit3.Enabled:=false;
  form2.DBEdit4.Enabled:=false;
  form2.DBEdit5.Enabled:=false;
  form2.DBEdit6.Enabled:=false;
  form2.DBCheckBox1.Enabled:=false;
  form2.DBCheckBox2.Enabled:=false;
  form2.ShowModal;
  form2.Free;
 end;
end;



procedure TForm1.Button2Click(Sender: TObject);
begin
  if not ADOTable1.IsEmpty then
 if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_DBGrid_to_Excel(self.DBGrid1,self.Caption);
end;

end.
