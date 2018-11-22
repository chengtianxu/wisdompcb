unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Mask, Grids, DBGrids, ComCtrls,
  Menus, ExtCtrls;

type
  TFrmMain = class(TForm)
    ADOConnection1: TADOConnection;
    StringGrid1: TStringGrid;
    StatusBar1: TStatusBar;
    DateADO: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOQuery5: TADOQuery;
    PopupMenu1: TPopupMenu;
    StringGrid2: TStringGrid;
    N1: TMenuItem;
    N2: TMenuItem;
    ADOquery1: TADODataSet;
    ADOquery1RKEY: TIntegerField;
    ADOquery1WORK_ORDER_PTR: TIntegerField;
    ADOquery1WORK_ORDER_NUMBER: TStringField;
    ADOquery1qty_on_hand: TFloatField;
    ADOquery1MFG_DATE: TDateTimeField;
    ADOquery1LOCATION: TStringField;
    ADOQuery4rkey: TAutoIncField;
    ADOQuery4quan_rej: TFloatField;
    ADOQuery4quan_prod: TFloatField;
    ADOQuery3RKEY: TAutoIncField;
    ADOQuery3MRB_NO: TStringField;
    ADOQuery3WO_PTR: TIntegerField;
    ADOQuery3TRAN_PTR: TIntegerField;
    ADOQuery3DEPT_PTR: TIntegerField;
    ADOQuery3REJECT_PTR: TIntegerField;
    ADOQuery3QTY_ORG_REJ: TIntegerField;
    ADOQuery3QTY_REJECT: TFloatField;
    ADOQuery3PANELS: TIntegerField;
    ADOQuery3BOM_PTR: TIntegerField;
    ADOQuery3FLOW_NO: TIntegerField;
    ADOQuery3STEP: TIntegerField;
    ADOQuery3EMPL_PTR: TIntegerField;
    ADOQuery3TDATETIME: TDateTimeField;
    ADOQuery3AUDIT_EMPL_PTR: TIntegerField;
    ADOQuery3AUDIT_DATETIME: TDateTimeField;
    ADOQuery3RESP_DEPT_PTR: TIntegerField;
    ADOQuery3REFERENCE: TStringField;
    ADOQuery3TTYPE: TSmallintField;
    ADOQuery5FG_SCP_DEPT_PTR: TIntegerField;
    ADOquery1step: TSmallintField;
    Aq53: TADOQuery;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    rkey34: TLabel;
    rkey39: TLabel;
    Edit3: TEdit;
    BitBtn4: TBitBtn;
    Edit6: TEdit;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Edit1: TMaskEdit;
    CheckBox1: TCheckBox;
    ADOquery1MANU_PART_NUMBER: TStringField;
    ADOquery1MANU_PART_DESC: TStringField;
    ADOquery1CUST_PART_PTR: TIntegerField;
    ADOQuery3warehouse_ptr: TIntegerField;
    ADOquery1WHOUSE_PTR: TIntegerField;
    tempt: TADOQuery;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    sql_text:string;

    { Private declarations }
    function find_error():boolean;

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses CustP_Search, Prod_Resource, DefectsLib, term,common,MyClass;

{$R *.dfm}
function TFrmMain.find_error():boolean;
var
 i:integer;
begin
result:=false;
 for i:=1 to stringgrid1.RowCount-1 do
  if (strtoint(stringgrid1.Cells[6,i])>0) then
   if (stringgrid1.Cells[9,i]='') or (stringgrid1.Cells[8,i]='') then
   result:=true;
end;

procedure TFrmMain.DBGrid1DblClick(Sender: TObject);
begin
  modalresult:=mrOk;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
if Adoconnection1.Connected then
 begin

  edit1.Text:=datetostr(getsystem_date(dateado,1));

  Edit1.SetFocus;
  ADOQuery5.Open;
  if Adoquery5.FieldByName('FG_scp_dept_ptr').AsInteger=0 then
   begin
    messagedlg('请先在控制开关模块中设置成品报废的申请部门！',mtinformation,[mbok],0);
    Application.Terminate;
   end;
 end;
end;


procedure TFrmMain.BitBtn7Click(Sender: TObject);
begin
if strtoint(statusbar1.Panels[1].Text) >0 then
 if messagedlg('你确定不保存此次报废就退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
  close
 else
  stringgrid1.SetFocus
else
 CLOSE;
end;

procedure TFrmMain.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if stringgrid1.Col=6 then
 if (pos(key,'0123456789')=0) and (key<>chr(8)) then
  Abort;
end;

procedure TFrmMain.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var i,vqty:integer;
begin
if (acol>7) then
 Stringgrid1.Options:=Stringgrid1.Options-[goEditing]
else
 Stringgrid1.Options:=Stringgrid1.Options+[goEditing];
  vqty:=0;
  for i:=1 to stringgrid1.rowcount-1 do
   vqty:=vqty+strtoint('0'+trim(stringgrid1.Cells[6,i]));
  statusbar1.Panels[1].Text :=inttostr(vqty);
 if vqty>0 then
  bitbtn6.Enabled:=true
 else
  bitbtn6.Enabled:=false;
end;

procedure TFrmMain.StringGrid1Exit(Sender: TObject);
var
  i,vqty:integer;
begin
  vqty:=0;
  for i:=1 to stringgrid1.rowcount-1 do
    vqty:=vqty+strtoint('0'+trim(stringgrid1.Cells[6,i]));
  statusbar1.Panels[1].Text :=inttostr(vqty);
 if vqty>0 then
 bitbtn6.Enabled:=true
 else
 bitbtn6.Enabled:=false;
end;

procedure TFrmMain.BitBtn6Click(Sender: TObject);
var
 i:integer;
begin
 if is_fg_counting then
 begin
  messagedlg('产成品正在进行盘点,不能进行报废处理!',mtinformation,[mbOk],0);
  Edit1.Setfocus;
  exit;
 end;

 if trim(Edit1.Text)='' then
  begin
   messagedlg('请输入报废/抽检单号!',mtinformation,[mbOk],0);
   Edit1.Setfocus;
   exit;
  end;

 if trim(Statusbar1.Panels[1].Text)='0' then
  begin
   messagedlg('请输入报废数量!',mtinformation,[mbOk],0);
   exit;
  end;

 if self.find_error then
  begin
   messagedlg('缺陷代码或者责任部门不允许为空!',mtinformation,[mbOk],0);
   exit;
  end;

 ADOConnection1.BeginTrans ;
 try

  Adoquery3.Close;
  Adoquery3.open;  //报废记录
  if not self.ADOQuery5.Active then adoquery5.Open;

  for i:=1 to stringgrid1.RowCount-1 do
   if strtoint(trim(Stringgrid1.Cells[6,i]))>0 then
    begin
     with Self.tempt do
     begin
      Close;
      sql.Clear;
      sql.Add('select * from data0053 where rkey=:rkey53');
      Parameters.ParamByName('rkey53').Value:=StrToInt(StringGrid2.Cells[0,i]);
      Open;
     end;
     if self.tempt.FieldByName('QTY_ON_HAND').Value<>StrToInt(StringGrid1.Cells[5,i]) then
     begin
       ShowMessage('第'+IntToStr(i)+'行库存发生变化,报废失败！');
     end
     else
     begin
     with self.Aq53 do
      begin                      //53
       close;
       parameters.ParamByName('onhand').Value := strtoint(trim(Stringgrid1.Cells[6,i]));
       parameters.ParamByName('rkey53').Value := strtoint(stringgrid2.Cells[0,i]);
       execsql;
      end;

 {    with Adoquery4 do        //06
       begin
        close;
        parameters.ParamByName('vptr').Value := stringgrid2.Cells[3,i];
        open;
       end;

      with Adoquery4 do
       begin
        edit;
        ADOQuery4quan_rej.Value:=ADOQuery4quan_rej.Value+
          strtoint('0'+trim(Stringgrid1.Cells[6,i]));
        ADOQuery4quan_prod.Value:= ADOQuery4quan_prod.Value-
          strtoint('0'+trim(Stringgrid1.Cells[6,i]));
        post;
       end;
  }
      with self.DateADO do
       begin
        close;
        sql.Text:='update data0025'+#13+
        'set QTY_ON_HAND=QTY_ON_HAND-'+trim(Stringgrid1.Cells[6,i])+#13+
        'where rkey='+stringgrid2.Cells[5,i];
        ExecSQL;
       end;

      with Adoquery3 do    //58
      begin
        append;
        self.ADOQuery3MRB_NO.Value:=edit1.Text;
        self.ADOQuery3WO_PTR.Value:=strtoint(stringgrid2.Cells[3,i]); //06.rkey
        ADOQuery3TRAN_PTR.Value:=strtoint(stringgrid2.Cells[0,i]); //53.rkey

        fieldbyname('flow_no').asinteger:=0;
        if stringgrid2.Cells[4,i]<>'' then
         fieldbyname('step').asinteger:=strtoint(stringgrid2.Cells[4,i])
        else
         fieldbyname('step').asinteger:=0;
        fieldbyname('panels').asstring:='0';

        self.ADOQuery3REJECT_PTR.Value:=strtoint(Stringgrid2.Cells[1,i]);

        self.ADOQuery3RESP_DEPT_PTR.Value:=strtoint(Stringgrid2.Cells[2,i]);

        self.ADOQuery3DEPT_PTR.Value:=Adoquery5FG_scp_dept_ptr.Value;

        fieldbyname('qty_reject').asInteger:=strtoint(trim(Stringgrid1.Cells[6,i]));
        fieldbyname('qty_org_rej').asInteger:=strtoint(trim(Stringgrid1.Cells[6,i]));

        self.ADOQuery3TDATETIME.Value:=getsystem_date(dateado,0);
        fieldbyname('empl_ptr').asstring:=user_ptr;
        ADOQuery3TTYPE.Value:=2;
        ADOQuery3REFERENCE.Value:=stringgrid1.Cells[7,i];//备注
        ADOQuery3warehouse_ptr.Value:=strtoint(stringgrid2.Cells[6,i]);
        post;
      end;
     end;
   end;

    ADOConnection1.CommitTrans;
    messagedlg('报废操作成功',mtinformation,[mbok],0);
    adoquery1.Close;


    for i:=1 to stringgrid1.RowCount-1 do
    begin
     stringgrid1.Rows[i].Clear;
     stringgrid2.Rows[i].Clear;
    end;
    stringgrid1.RowCount:=2;
    stringgrid2.RowCount:=2;

    stringgrid1.Enabled:=false;
    statusbar1.Panels[1].Text := '0'
  except
   on E: Exception do
    begin
     self.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TFrmMain.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (stringgrid1.Col=6) and
 (trim(stringgrid1.Cells[stringgrid1.col,stringgrid1.row])='') then
 stringgrid1.Cells[stringgrid1.col,stringgrid1.row]:='0';

 if strtoint('0'+trim(Stringgrid1.Cells[6,stringgrid1.Row]))>
   strtoint('0'+trim(Stringgrid1.Cells[5,stringgrid1.Row]))
 then
  Stringgrid1.Cells[6,stringgrid1.Row]:=Stringgrid1.Cells[5,stringgrid1.Row]
end;

procedure TFrmMain.BitBtn4Click(Sender: TObject);
var
 i:integer;
begin
FrmDefectsLib:=tFrmDefectsLib.Create(application);
if FrmDefectsLib.showmodal=mrOk then
 begin
  Edit3.Text :=FrmDefectsLib.Adoquery1.fieldbyname('REJ_code').asstring;
  label4.Caption :=FrmDefectsLib.Adoquery1.fieldbyname('reject_description').asstring;
  rkey39.Caption:=FrmDefectsLib.ADOQuery1RKEY.AsString;
  for i:=1 to stringgrid1.RowCount-1 do
  if trim(stringgrid1.Cells[8,i])='' then
   begin
    stringgrid1.Cells[8,i]:=edit3.Text;
    stringgrid2.Cells[1,i]:=rkey39.Caption;
   end;
 end;
FrmDefectsLib.Free;
end;

procedure TFrmMain.BitBtn5Click(Sender: TObject);
var
 i:integer;
begin
FrmProdResource:=tFrmProdResource.Create(application);
if FrmProdResource.showmodal=mrOk then
 begin
  Edit6.Text :=FrmProdResource.Adoquery1.fieldbyname('dept_code').asstring;
  Label2.Caption :=FrmProdResource.Adoquery1.fieldbyname('dept_name').asstring;
  rkey34.Caption :=FrmProdResource.Adoquery1.fieldbyname('rkey').asstring;
  for i:=1 to stringgrid1.RowCount-1 do
  if trim(stringgrid1.Cells[9,i])='' then
   begin
    stringgrid1.Cells[9,i]:=edit6.Text;
    stringgrid2.Cells[2,i]:=rkey34.Caption;
   end;
 end;
FrmProdResource.Free;
end;

procedure TFrmMain.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   StringGrid1.MouseToCell(x,y,column,row);
   if row<>0 then StringGrid1.Row:=row;
   StringGrid1.Col:=column;
 end;
end;

procedure TFrmMain.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
if acol>7 then
 begin
  StringGrid1.Canvas.Brush.Color:= clscrollbar;
  StringGrid1.Canvas.FillRect(rect);
  StringGrid1.Canvas.TextRect(rect,rect.left,rect.Top, StringGrid1.Cells[acol,aRow]);
 end;
end;

procedure TFrmMain.N1Click(Sender: TObject);
begin
FrmDefectsLib:=tFrmDefectsLib.Create(application);
if FrmDefectsLib.showmodal=mrOk then
 begin
  stringgrid1.Cells[8,stringgrid1.Row] :=
    FrmDefectsLib.ADOQuery1REJ_CODE.Value;
  stringgrid2.Cells[1,stringgrid1.Row]:=frmdefectslib.ADOQuery1RKEY.AsString;
 end;
FrmDefectsLib.Free;
end;

procedure TFrmMain.N2Click(Sender: TObject);
begin
FrmProdResource:=tFrmProdResource.Create(application);
if FrmProdResource.showmodal=mrOk then
 begin
  stringgrid1.Cells[9,stringgrid1.Row]:=frmprodresource.ADOQuery1dept_code.Value;
  stringgrid2.Cells[2,stringgrid1.Row]:=frmprodresource.ADOQuery1rkey.AsString;
 end;
FrmProdResource.Free;
end;

procedure TFrmMain.CheckBox1Click(Sender: TObject);
var
 i:integer;
begin
 if checkbox1.Checked then
 begin
  for i:=1 to stringgrid1.RowCount-1 do
   stringgrid1.Cells[6,i]:=stringgrid1.Cells[5,i];
 end
else
 begin
  for i:=1 to stringgrid1.RowCount-1 do
   stringgrid1.Cells[6,i]:='0';
 end;
stringgrid1.SetFocus;
checkbox1.SetFocus;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
 if not app_init(self.ADOConnection1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
  application.Terminate;
 end;
 self.Caption:=application.Title;
 sql_text:=ADOquery1.CommandText;
 MyDataClass :=TMyDataClass.Create(ADOConnection1);  
end;

procedure TFrmMain.FormActivate(Sender: TObject);
begin
  Stringgrid1.cells[0,0]:='工作单号';
  Stringgrid1.cells[1,0]:='本厂编号';
//  Stringgrid1.cells[2,0]:='版本';
  stringgrid1.ColWidths[2]:=-1;
  Stringgrid1.cells[3,0]:='完工日期';
  Stringgrid1.cells[4,0]:='存放位置';
  Stringgrid1.cells[5,0]:='库存数量';
  Stringgrid1.cells[6,0]:='报废数量';
  Stringgrid1.cells[7,0]:='备注';
  Stringgrid1.cells[8,0]:='缺陷代码';
  Stringgrid1.cells[9,0]:='责任部门';

  stringgrid2.Cells[0,0]:='rkey53';
  stringgrid2.Cells[1,0]:='rkey39';
  stringgrid2.Cells[2,0]:='rkey34';
  stringgrid2.Cells[3,0]:='rkey06';
  stringgrid2.Cells[4,0]:='stepnumber';
  stringgrid2.Cells[5,0]:='rkey25';
  stringgrid2.Cells[6,0]:='rkey15';
 bitbtn2click(sender);
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
var
 i:integer;
begin
if strtoint(statusbar1.Panels[1].Text) >0 then
if messagedlg('当前有报废数理未保存,重新查询可能导致报废数据丢失继续吗?',
 mtconfirmation,[mbyes,mbno],0)=mrno then
 exit;

try
 form_condition:=tform_condition.Create(application);
 if form_condition.ShowModal=mrok then
 begin
  adoquery1.Close;
  adoquery1.CommandText:=sql_text;
  for i:=1 to form_condition.SGrid1.RowCount-2 do
   adoquery1.CommandText:=adoquery1.CommandText+
   form_condition.SGrid1.Cells[2,i]+#13;
  adoquery1.CommandText:=adoquery1.CommandText+
  ' and data0053.mfg_date >= '''+ formatdatetime('yyyy-mm-dd',form_condition.DateTimePicker1.Date)+' '+formatdatetime('hh:nn:ss',form_condition.DateTimePicker2.Time)+ ''''+
  ' and data0053.mfg_date <= '''+ formatdatetime('yyyy-mm-dd',form_condition.DateTimePicker3.Date)+' '+formatdatetime('hh:nn:ss',form_condition.DateTimePicker4.Time)+ ''''+#13;
  adoquery1.CommandText:=adoquery1.CommandText+
  ' order by data0025.manu_part_number,data0053.mfg_date';
  //showmessage(adoquery1.CommandText);
  adoquery1.Open;
  adoquery1.First;
  if not adoquery1.IsEmpty then
  begin
   stringgrid1.Enabled := true;
   for i:=1 to stringgrid1.RowCount-1 do
   begin
    stringgrid1.Rows[i].Clear;
    stringgrid2.Rows[i].Clear;
   end;
   stringgrid1.RowCount := adoquery1.RecordCount+1;
   stringgrid2.RowCount := adoquery1.RecordCount+1;

   while not adoquery1.Eof do
   begin
    Stringgrid1.cells[0,adoquery1.RecNo] := ADOquery1WORK_ORDER_NUMBER.Value; //'工作单号';
    Stringgrid1.cells[1,adoquery1.RecNo] := ADOquery1MANU_PART_NUMBER.Value; //'本厂编号';
//    Stringgrid1.cells[2,adoquery1.RecNo] := ADOquery1CP_REV.Value; //'版本';
    Stringgrid1.cells[3,adoquery1.RecNo] := ADOquery1MFG_DATE.AsString; //'完工日期';
    Stringgrid1.cells[4,adoquery1.RecNo] := ADOquery1LOCATION.Value; //'存放位置';
    Stringgrid1.cells[5,adoquery1.RecNo] := ADOquery1qty_on_hand.AsString; //'库存数量';
    Stringgrid1.cells[6,adoquery1.RecNo] := '0';
    Stringgrid1.cells[8,adoquery1.RecNo] := edit3.Text;
    Stringgrid1.cells[9,adoquery1.RecNo] := edit6.Text;

    Stringgrid2.cells[0,adoquery1.RecNo] := ADOquery1RKEY.AsString;
    Stringgrid2.cells[1,adoquery1.RecNo] := rkey39.Caption;
    Stringgrid2.cells[2,adoquery1.RecNo] := rkey34.Caption;
    Stringgrid2.cells[3,adoquery1.RecNo] := ADOquery1WORK_ORDER_PTR.AsString;
    Stringgrid2.cells[4,adoquery1.RecNo] := ADOquery1step.AsString;
    Stringgrid2.cells[5,adoquery1.RecNo] := ADOquery1CUST_PART_PTR.AsString;
    Stringgrid2.cells[6,adoquery1.RecNo] := ADOquery1WHOUSE_PTR.AsString;
    adoquery1.Next;
   end;
  end
  else
   messagedlg('查询结果数据为空,保持原数据不变!',mtinformation,[mbok],0);
 end;
finally
 form_condition.Free;
end;
end;

procedure TFrmMain.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(adoquery1.CommandText);
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
 MyDataClass.Free;
end;

end.
