unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Menus, ExtCtrls, DBGridEh,
  DB, ADODB;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure N4Click(Sender: TObject);
  private
    FColumn: TColumnEh ;
  public
    { Public declarations }
   sys_longdate:tdatetime;
  end;

var
  Form1: TForm1;

implementation
 uses damo, shipped_meth, warehouse_search, report_r, shipsupp_sql,common;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not app_init(dm.ADOConnection1) then
 begin
   showmsg('程序启动失败,请与管理员联系!',1);
   application.Terminate;
 end;
  self.Caption:=application.Title;

 // user_ptr:='785';
 // vprev:='4';
  //dm.ADOConnection1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  dm.ADOQuery1.SQL.Text:='select getdate() as serve_date';
  dm.ADOQuery1.Open;
  self.sys_longdate :=dm.ADOQuery1.fieldvalues['serve_date'];
  FColumn:=DBGridEh1.columns[0];
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  try
    form2:=tform2.Create(application);
    form2.Edit2.Text := dm.ADO22barcode_id.Value;
    if form2.ShowModal=mrok then
    begin
      dm.ADO22.close;
      dm.ADO22.Open;
    end;
  finally
    form2.free;
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  try
    form_wh:=tform_wh.Create(application);
    if form_wh.ADOQuery1.IsEmpty then
      messagedlg('没有找到相关记录!',mtconfirmation,[mbok],0)
    else if form_wh.ShowModal=mrok then
    begin
      edit1.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
      label2.Caption := form_wh.ADOQuery1.FieldValues['warehouse_name'];
      dm.ADO22.Close;
      dm.ADO22.Parameters[1].Value := form_wh.ADOQuery1.FieldValues['rkey'];
      dm.ADO22.Open;
      dm.ADO22.Sort:=FColumn.FieldName + ' ASC';
   {  dm.ADO96.Close;
      dm.ADO96.Parameters[0].Value:=dm.ADO22rkey.Value;
      dm.ADO96.Open;   }
    end;
  finally
    form_wh.free;
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 n1.Enabled:=dm.ADO22.Active and (dm.ADO22quan_to_be_shipped.Value>0);
 n2.Enabled:=n1.Enabled;
end;

procedure TForm1.N2Click(Sender: TObject);
var sQt:string;
begin
  if messagedlg('确定退仓吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
    dm.ADOConnection1.BeginTrans;
    try
      dm.ADO22.Edit;
      sQt:=dm.ADO22quan_to_be_shipped.AsString;
      dm.ADO22quan_on_hand.Value:=dm.ADO22quan_on_hand.Value+dm.ADO22quan_to_be_shipped.Value;
      dm.ADO22quan_to_be_shipped.Value := 0;
      dm.ADO22.Post;

      DM.ADOQuery1.Close;
      DM.ADOQuery1.SQL.Text:='update data0017 set quan_on_hand=quan_on_hand+'+sQt+
                             ' where rkey='+dm.ADO22inventory_ptr.AsString;
      DM.ADOQuery1.ExecSQL;

      DM.ADOQuery1.Close;
      DM.ADOQuery1.SQL.Text:='delete from data0096  where inv_tran_ptr='+dm.ADO22rkey.asstring+' and isnull(status,0)=0 and flag=2';
      DM.ADOQuery1.ExecSQL;

      dm.ADOConnection1.CommitTrans;
      showmessage('退仓成功!');
      DM.ADO96.Close;
      DM.ADO96.Open;
    except
      on e:exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        // showmessage('更新错误:'+e.Message);
        showmessage('更新错误,退仓数量状态发生变化');
        dm.ADO22.Close;
        dm.ADO22.Open;
        exit;
      end;
    end;

  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 form3:=tform3.Create(application);
 form3.ShowModal;
 dm.ADOStoredProc1.Close;
 form3.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 try
  form_report:=tform_report.Create(application);
   form_report.ppReport1.Reset;
   form_report.ppReport1.Template.FileName :=
     stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
        'returen_supp_WZ.rtm';
   form_report.ppReport1.Template.LoadFromFile;
   form_report.ppReport1.SaveAsTemplate:=True;
  form_report.ppDesigner1.ShowModal;
 finally
  form_report.free;
 end;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
   showmessage(memo1.Text);

end;

procedure TForm1.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var sortstring:string;
begin
  if not DBGridEh1.DataSource.DataSet.Active then exit;
  case Column.Title.SortMarker of
    smNoneEh,smUpEh: sortstring := Column.FieldName + ' DESC';
    smDownEh:        sortstring := Column.FieldName + ' ASC';
  end;
  
  TADODataSet(DBGridEh1.DataSource.DataSet).sort:=sortstring;
  if FColumn<>Column then
  begin
    FColumn.Title.Color:=clBtnFace;
    FColumn:=Column;
  end;
  Column.Title.Color:=clred;
 { DM.ADO96.Close;
  DM.ADO96.Parameters[0].Value:=DM.ADO22rkey.Value;
  DM.ADO96.Open;    }
end;


procedure TForm1.N4Click(Sender: TObject);
begin
  dm.ADO22.Close;
  dm.ADO22.Open;
end;

end.
