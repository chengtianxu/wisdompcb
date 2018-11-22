
//Provider=SQLOLEDB.1;Password=WZtopcberp_1077;Persist Security Info=True;User ID=wzsp;Initial Catalog=WISDOMPCB;Data Source=W001057;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=W119;Use Encryption for Data=False;Tag with column collation when possible=False
unit customerpart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, Db, DBTables, ComCtrls,
  Menus, ADODB, ExtCtrls;

type
  TFrmCustPart = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery3: TADOQuery;
    Splitter1: TSplitter;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Bar1: TStatusBar;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ADOConnection1: TADOConnection;
    db_ptr: TLabel;
    ADOQuery2: TADOQuery;
    ADOQuery1: TADOQuery;
    DateADO: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
   private
    vindex:Integer;
    hMapFile: THandle;
    MapFilePointer: Pointer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCustPart: TFrmCustPart;
implementation


{$R *.DFM}
uses
   customersearch, confirm
   ,common;

procedure TFrmCustPart.FormActivate(Sender: TObject);
begin
  Adoquery1.Open ;
  Dbgrid1.SetFocus;  //在程序开始时edit1得到焦点
end;

procedure TFrmCustPart.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCustSearch, FrmCustSearch);
  if FrmCustSearch.Adoquery1.active=false then
    FrmCustSearch.Adoquery1.active:=true;
  FrmCustSearch.MaskEdit1.text:=edit1.Text;
  if FrmCustSearch.showmodal=mrOk then
  if not FrmCustSearch.Adoquery1.eof then
  with Adoquery1 do
  begin
    close;
    sql.clear;
    sql.Add('select data0010.cust_code,data0025.MANU_PART_NUMBER,');
    sql.Add('data0025.MANU_PART_DESC,data0119.*');
    sql.Add('from data0010,data0119,data0025');
    sql.Add('where data0119.cust_part_ptr=data0025.rkey');
    sql.Add('and data0025.customer_ptr=data0010.rkey');
    sql.Add('and (data0119.ent_date>=:vdate1 and data0119.ent_date<=:vdate2)');
    sql.Add('and data0025.customer_ptr='+FrmCustSearch.Adoquery1.fieldbyname('rkey').asstring);
    sql.Add('order by data0025.MANU_PART_NUMBER');
    parameters.ParamByName('vdate1').Value :=Datetimepicker1.Date;
    parameters.ParamByName('vdate2').Value :=Datetimepicker2.Date;
    prepared;
    open;
    Edit1.Text:=FrmCustSearch.Adoquery1.fieldbyname('cust_code').asstring;
    label1.Caption :=FrmCustSearch.Adoquery1.fieldbyname('customer_name').asstring;
  end else messagedlg('没有选择客户代号！',mtinformation,[mbOk],0);
  FrmCustSearch.free;
end;

procedure TFrmCustPart.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey];
if Key = Chr(vk_Back) then       //如果按下了backspace
   begin
    if length(bar1.SimpleText)>10 then
     bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
    if length(bar1.SimpleText)>10 then
       Adoquery1.Locate('MANU_PART_DESC',copy(bar1.SimpleText,11,length(bar1.SimpleText)),searchoption)
    else
     Adoquery1.First
   end
  else
     begin
       bar1.SimpleText :=bar1.SimpleText+key;
       Adoquery1.Locate('MANU_PART_DESC',copy(bar1.SimpleText,11,length(bar1.SimpleText)),searchoption);
     end;
end;


procedure TFrmCustPart.Edit1Click(Sender: TObject);
begin
edit1.SelectAll; //选口所有的文本
end;

procedure TFrmCustPart.SpeedButton1Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TFrmCustPart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFrmCustPart.Edit1Exit(Sender: TObject);
begin
  if TRIM(Edit1.text)='' then
  begin
    with Adoquery1 do
    begin
      close;
      sql.clear;
      sql.Add('select data0010.cust_code,data0025.MANU_PART_NUMBER,');
      sql.Add('data0025.MANU_PART_DESC,data0119.*');
      sql.Add('from data0010,data0119,data0025');
      sql.Add('where data0119.cust_part_ptr=data0025.rkey');
      sql.Add('and data0025.customer_ptr=data0010.rkey');
      sql.Add('and (data0119.ent_date>=:vdate1 and data0119.ent_date<=:vdate2)');
      sql.Add('order by data0025.MANU_PART_NUMBER');
      parameters.ParamByName('vdate1').Value :=Datetimepicker1.Date;
      parameters.ParamByName('vdate2').Value :=Datetimepicker2.Date;
      prepared;
      open;
      label1.Caption :='';
    end;
    Dbgrid1.SetFocus;
    exit;
  end;
  Application.CreateForm(TFrmCustSearch, FrmCustSearch);
  if FrmCustSearch.Adoquery1.active=false then
    FrmCustSearch.Adoquery1.active:=true;
  FrmCustSearch.MaskEdit1.text:=edit1.Text;
  if not FrmCustSearch.Adoquery1.eof then
  with Adoquery1 do
  begin
    close;
    sql.clear;
    sql.Add('select data0010.cust_code,data0025.MANU_PART_NUMBER,');
    sql.Add('data0025.MANU_PART_DESC,data0119.*');
    sql.Add('from data0010,data0119,data0025');
    sql.Add('where data0119.cust_part_ptr=data0025.rkey');
    sql.Add('and data0025.customer_ptr=data0010.rkey');
    sql.Add('and (data0119.ent_date>=:vdate1 and data0119.ent_date<=:vdate2)');
    sql.Add('and data0025.customer_ptr='+FrmCustSearch.Adoquery1.fieldbyname('rkey').asstring);
    sql.Add('order by data0025.MANU_PART_NUMBER');
    parameters.ParamByName('vdate1').Value :=Datetimepicker1.Date;
    parameters.ParamByName('vdate2').Value :=Datetimepicker2.Date;
    prepared;
    open;
    label1.Caption :=FrmCustSearch.Adoquery1.fieldbyname('customer_name').asstring;
  end else messagedlg('没有这个客户代号！',mtinformation,[mbOk],0);
  Dbgrid1.SetFocus;
end;

procedure TFrmCustPart.ADOQuery1CalcFields(DataSet: TDataSet);
begin
  IF aDOQUERY1.FieldByName('PROD_CONF').AsInteger=0
    then Adoquery1.FieldByName('CSTATUS').AsString :='未确认'
  else
  IF aDOQUERY1.FieldByName('PROD_CONF').AsInteger=1
    then Adoquery1.FieldByName('CSTATUS').AsString :='假确认'
  else
  IF aDOQUERY1.FieldByName('PROD_CONF').AsInteger=2
    then Adoquery1.FieldByName('CSTATUS').AsString :='真确认';
end;

procedure TFrmCustPart.DateTimePicker1CloseUp(Sender: TObject);
begin
  Datetimepicker2.SetFocus;
end;

procedure TFrmCustPart.DateTimePicker1Exit(Sender: TObject);
begin
  Datetimepicker2.SetFocus;
end;

procedure TFrmCustPart.DateTimePicker2Exit(Sender: TObject);
begin
  with Adoquery1 do
  begin
    close;
    parameters.ParamByName('vdate1').Value :=strtodate(datetostr(Datetimepicker1.Date));
    parameters.ParamByName('vdate2').Value :=strtodate(datetostr(Datetimepicker2.Date+1));
    open;
  end;
  DbGrid1.SetFocus;
end;

procedure TFrmCustPart.DateTimePicker2CloseUp(Sender: TObject);
begin
  DbGrid1.SetFocus;
end;

procedure TFrmCustPart.FormCreate(Sender: TObject);
var
S: string;
begin
  {hMapFile := CreateFileMapping ($FFFFFFFF,
    nil, page_ReadWrite, 0,100, 'xyz2055coimasp20');
  MapFilePointer := MapViewOfFile (hMapFile,File_Map_All_Access, 0, 0, 0);
  S := PChar (MapFilePointer);
  vpass.Caption := copy(S,1,2);
  user_ptr.Caption := trim(copy(S,3,pos(' ',s)-2));
  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1));
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s)));
  {}

  if not App_Init(ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;

end;

procedure TFrmCustPart.FormShow(Sender: TObject);
begin
  {
  if Adoconnection1.Connected then
  begin
    user_ptr.Caption :='0';
    exit;
  end;
  if (vpass.Caption<>'AA') OR
    (trim(vprev.Caption)='') then
  begin
    Application.Terminate;
    exit;
  end;
  Adoconnection1.ConnectionString := db_ptr.Caption ;
  Adoconnection1.Connected := true;

  {}
  Datetimepicker1.Date := now - 60;
  Datetimepicker2.Date := now;
  with Adoquery1 do
  begin
    close;
    parameters.ParamByName('vdate1').Value :=strtodate(datetostr(Datetimepicker1.Date));
    parameters.ParamByName('vdate2').Value :=strtodate(datetostr(Datetimepicker2.Date+1));
    open;
  end;
  Adoquery2.Open ;
  vindex:=0;
end;

procedure TFrmCustPart.Edit2Change(Sender: TObject);
begin
  if Trim(edit3.Text)='' then
    if Trim(edit2.Text)<>'' then
      if Checkbox1.Checked then
        Adoquery1.Filter :='MANU_PART_DESC like ''%'+trim(edit2.Text)+'%'''
      else
        Adoquery1.Filter :='MANU_PART_DESC like '''+trim(edit2.Text)+'%'''
    else
      Adoquery1.Filter :=''
  else
    if Trim(edit2.Text)<>'' then
      if Checkbox1.Checked then
        Adoquery1.Filter :='MANU_PART_DESC like ''%'+trim(edit2.Text)+'%'' and MANU_PART_NUMBER like '''+trim(edit3.Text)+'%'''
      else
        Adoquery1.Filter :='MANU_PART_DESC like '''+trim(edit2.Text)+'%'' and MANU_PART_NUMBER like '''+trim(edit3.Text)+'%'''
    else
      Adoquery1.Filter :='MANU_PART_NUMBER like '''+trim(edit3.Text)+'%''';
end;

procedure TFrmCustPart.N1Click(Sender: TObject);
var
 vrec:integer;
begin
  Dateado.Close;
  Dateado.Open;
  Application.CreateForm(TFrmConfirm, FrmConfirm);
  if FrmConfirm.showmodal=mrok then
  begin
    Adoquery1.Edit;
    if Adoquery1.FieldByName('PROD_CONF_BY_PTR').asstring<> user_ptr then
      Adoquery1.FieldByName('PROD_CONF_BY_PTR').asstring:= user_ptr;
    Adoquery1.FieldByName('PROD_CONF_DATE').asdatetime:=DateAdo.fieldbyname('vdt').AsDateTime;
    Adoquery1.Post;
  end else
    if Adoquery1.Modified then
      Adoquery1.Cancel;
  vrec:=adoquery1.RecNo;
  Adoquery1.Close;
  Adoquery1.Open;
  Adoquery1.MoveBy(vrec-1);
  FrmConfirm.free;
end;

procedure TFrmCustPart.RadioGroup1Click(Sender: TObject);
begin
  with Adoquery1 do
  begin
    close;
    if Radiogroup1.ItemIndex<3 then
        if sql.Count<8 then
            begin
              sql.Delete(6);
              sql.Add('and data0119.PROD_CONF = :vptr');
              sql.Add('order by data0025.MANU_PART_NUMBER');
            end;
    if Radiogroup1.ItemIndex=3 then
        if sql.Count=8 then
            begin
              sql.Delete(7);
              sql.Delete(6);
              sql.Add('order by data0025.MANU_PART_NUMBER');
            end;
    if Radiogroup1.ItemIndex<3 then
        parameters.ParamByName('vptr').Value :=Radiogroup1.ItemIndex;
    open;
  end;
end;

procedure TFrmCustPart.BitBtn1Click(Sender: TObject);
begin
  IF DBGrid1.DataSource.DataSet.Active THEN
      IF DBGrid1.DataSource.DataSet.RecordCount > 0 THEN
           BEGIN
                 Export_dbGrid_to_Excel(DBGrid1,'转产管理');
           END;
end;

end.
