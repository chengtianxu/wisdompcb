unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, DB, ADODB, Mask,
  DBCtrls, Menus;

type
  TForm1 = class(TForm)
    Bar1: TStatusBar;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    ADOTable1: TADOTable;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    PopupMenu1: TPopupMenu;
    add_ware: TMenuItem;
    edit_ware: TMenuItem;
    copy_ware: TMenuItem;
    del_ware: TMenuItem;
    AQ04: TADOQuery;
    ADOTable1RKEY: TAutoIncField;
    ADOTable1WAREHOUSE_CODE: TStringField;
    ADOTable1WAREHOUSE_NAME: TStringField;
    ADOTable1ABBR_NAME: TStringField;
    ADOTable1ADDRESS_LINE_1: TStringField;
    ADOTable1ADDRESS_LINE_2: TStringField;
    ADOTable1ADDRESS_LINE_3: TStringField;
    ADOTable1STATE: TStringField;
    ADOTable1ZIP: TStringField;
    ADOTable1PHONE: TStringField;
    ADOTable1FAX: TStringField;
    ADOTable1EMPLOYEE_PTR_1: TIntegerField;
    ADOTable1EMPLOYEE_PTR_2: TIntegerField;
    ADOTable1EMPLOYEE_PTR_3: TIntegerField;
    AQ04seed_value: TStringField;
    AQ04seed_flag: TWordField;
    ADOTable1ENG_NAME: TStringField;
    ADOTable1WEB: TStringField;
    ADOTable1TELEX: TStringField;
    ADOTable1o_warehouse_name: TStringField;
    ADOTable1o_eng_name: TStringField;
    ADOTable1o_address_1: TStringField;
    ADOTable1o_address_2: TStringField;
    ADOTable1o_address_3: TStringField;
    ADOTable1o_state: TStringField;
    ADOTable1o_zip: TStringField;
    ADOTable1o_phone: TStringField;
    ADOTable1o_fax: TStringField;
    ADOTable1o_telex: TStringField;
    ADOTable1o_web: TStringField;
    ADOTable1purchase_order: TStringField;
    ADOTable1o_purchase_order: TStringField;
    ADOTable1picture: TBlobField;
    ADOTable1o_picture: TBlobField;
    ADOTable1WAREHOUSE_TYPE: TStringField;
    ADOTable1part_batch: TStringField;
    ADOTable1part_templet: TStringField;
    ADOTable1active_flag: TStringField;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edit_wareClick(Sender: TObject);
    procedure add_wareClick(Sender: TObject);
    procedure del_wareClick(Sender: TObject);
    procedure ADOTable1AfterDelete(DataSet: TDataSet);
    procedure ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure copy_wareClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses edit_warehouse,common;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if column.Index=1 then
 begin
  column.Title.Caption:='*'+'工厂名称';
  dbgrid1.Columns[0].Title.Caption:='工厂代码';
  adotable1.IndexFieldNames:='warehouse_name';
 end
else
 begin
  column.Title.Caption:='*'+'工厂代码';
  dbgrid1.Columns[1].Title.Caption:='工厂名称';
  adotable1.IndexFieldNames:='warehouse_code';
 end;
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
   Adotable1.Locate(adotable1.IndexFieldNames,copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption)
  else
   adotable1.First
 end
 else
  if key=chr(vk_return) then    //如果按下了enter
   edit_wareclick(sender)           //调用编辑命令
  ELSE
   begin
    bar1.SimpleText := bar1.SimpleText+key;
    Adotable1.Locate(adotable1.IndexFieldNames,copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
   end;
end;

procedure TForm1.edit_wareClick(Sender: TObject);
begin
 try
  adotable1.Edit;
  form2:=Tform2.Create(application);
  form2.ShowModal;
 finally
  form2.free;
 end;
end;

procedure TForm1.add_wareClick(Sender: TObject);
begin
 adotable1.Append;
 try
  form2:=Tform2.Create(application);
  edit_warehouse.Form2.DBCheckBox1.Checked:=True;
  form2.ShowModal;
   finally
  form2.Free;
 end;
end;

procedure TForm1.del_wareClick(Sender: TObject);
begin
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 adotable1.Delete;
end;

procedure TForm1.ADOTable1AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TForm1.ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('不能删除该仓库,已有库存!',mtwarning,[mbcancel],0);
 abort;
end;

procedure TForm1.copy_wareClick(Sender: TObject);
var
 v_recode:array[2..34] of variant;
 i:word;
begin
for i:=2 to 34 do
  v_recode[i]:=adotable1.Fields[i].Value;
 adotable1.Append;
 for i:=2 to 34 do
  adotable1.fieldvalues[adotable1.Fields[i].FieldName]:=v_recode[i];
 try
  form2:=Tform2.Create(application);
  form2.ShowModal;
 finally
  form2.Free;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(ADOConnection1) then
   begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
   end;
 self.Caption:=application.Title;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if  Adoconnection1.Connected then
 begin

  aq04.Open;
  adotable1.Open;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if adotable1.IsEmpty then
 begin
  copy_ware.Enabled:=false;
  edit_ware.Enabled:=false;
  del_ware.Enabled:=false;
 end
else
 begin
  copy_ware.Enabled:=true;
  edit_ware.Enabled:=true;
  del_ware.Enabled:=true;
 end;
end;

end.
