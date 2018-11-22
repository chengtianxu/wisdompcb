unit AcctNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, Menus, Mask, ComCtrls,
  ToolWin,DateUtils, ADODB, RpCon, RpConDS, RpBase, RpSystem, RpDefine,
  RpRave,DB, DBGrids, DBCtrls;

type
  TFrmAcctNote = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel2: TPanel;
    Label8: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TMaskEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    ttype: TLabel;
    N4: TMenuItem;
    N5: TMenuItem;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    sgrid1: TStringGrid;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    sgrid2: TStringGrid;
    Label1: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit4: TEdit;
    Panel3: TPanel;
    CheckBox1: TCheckBox;
    N6: TMenuItem;
    N7: TMenuItem;
    SpeedButton7: TSpeedButton;
    Edit15: TEdit;
    Label29: TLabel;
    N8: TMenuItem;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Edit7: TEdit;
    Label3: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    N9: TMenuItem;
    N10: TMenuItem;
    procedure DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure sgrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure sgrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure sgrid1Exit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    function vo_number(number: string): boolean;
    function get_col5(row:integer):currency;
    function get_col6(row:integer):currency;
    procedure N8Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure Edit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N10Click(Sender: TObject);
  private

   procedure calu();//计算本币、原币
   procedure recalculation();
   //修改
   procedure UpdateAcct();
   function get_gltp(rkey103: string): integer;
   function get_glcurr_ptr(rkey103: string): integer;
   procedure report_print(rkey105:integer);
   procedure update_grid1_grid2();
   function edit_flag():boolean;
   procedure status_update();
  public
    //生成SQL语句
    function Get105InsertSQl():string;
    //生成Update SQL语句
    function Get105UpdateSQl(const pDh:string):string;
    { Public declarations }

  end;

var
  FrmAcctNote: TFrmAcctNote;

implementation

uses AcctSearch,Datamodule, Main, Dictionary,
 voucher_report, curr_search,common, vouchersearch;

{$R *.dfm}
procedure TFrmAcctNote.recalculation();
var i:integer;
  vdb,vcr:real;
begin
  vdb:=0;
  vcr:=0;
  for i:=1 to sgrid1.rowcount-2 do
  begin
    if trim(sgrid1.Cells[5,i])<>'' then
    vdb:=vdb+strtofloat(sgrid1.Cells[5,i]);
    if trim(sgrid1.Cells[6,i])<>'' then
    vcr:=vcr+strtofloat(sgrid1.Cells[6,i]);
  end;
  edit2.Text :=format('%.2f',[vdb]);
  edit3.Text :=format('%.2f',[vcr]);
end;

procedure TFrmAcctNote.status_update;
begin
 if strtoint(self.ttype.Caption)=1 then
  if dm.Ado105status.Value=0 then
   begin
    speedbutton9.Enabled:=true;
    speedbutton1.Enabled:=true;
    speedbutton2.Enabled:=true;
    speedbutton3.Enabled:=true;
    speedbutton4.Enabled:=true;
    speedbutton5.Enabled:=true;
    speedbutton6.Enabled:=true;

//    sgrid1.Options:=sgrid1.Options+[goEditing];
    sgrid1.PopupMenu:=popupmenu1;
    self.DateTimePicker1.Enabled:=true;
    edit5.Enabled:=true;
    edit7.Enabled:=true;
   end
  else
   begin
    speedbutton9.Enabled:=false;
    speedbutton1.Enabled:=false;
    speedbutton2.Enabled:=false;
    speedbutton3.Enabled:=false;
    speedbutton4.Enabled:=false;
    speedbutton5.Enabled:=false;
    speedbutton6.Enabled:=false;

//    sgrid1.Options:=sgrid1.Options-[goEditing];
    sgrid1.PopupMenu:=nil;
    self.DateTimePicker1.Enabled:=false;
    edit5.Enabled:=false;
    edit7.Enabled:=false;
   end;
end;

function TFrmAcctNote.edit_flag: boolean;
var
 i:integer;
begin
result:=false;
if (self.DateTimePicker1.Date<>dm.Ado105entered_dt.Value) or
   (strtoint(edit5.Text)<>dm.Ado105ATTACHED.Value) or
   (dm.ADOQ0106.RecordCount<>sgrid2.RowCount-2) or
   (trim(dm.Ado105BATCH_NUMBER.Value)<>trim(edit7.Text)) then
 result:=true
 else
begin
 dm.ADOQ0106.First;
 dm.ADOQ0106.DisableControls;
 for i:=1 to dm.ADOQ0106.RecordCount do
  begin
   if trim(sgrid1.Cells[4,i])='' then    sgrid1.Cells[4,i]:='0';
   if (dm.ADOQ0106GL_ACCT_NO_PTR.Value<>strtoint(sgrid2.Cells[1,i])) or
      (dm.ADOQ0106CURR_PTR.Value<>strtoint(sgrid2.Cells[2,i])) or
      (trim(sgrid1.Cells[0,i])<>trim(dm.ADOQ0106DESCRIPTION.Value)) or
      (strtocurr(sgrid1.Cells[4,i])<>strtocurr(
                                  formatfloat('0.00',dm.ADOQ0106AMOUNT.Value*
                                  dm.ADOQ0106EXCH_RATE.Value))) then
    begin
     result:=true;
     break;
    end;
   dm.ADOQ0106.Next;
  end;
 dm.ADOQ0106.First;
 dm.ADOQ0106.EnableControls;
end;
end;


procedure TFrmAcctNote.update_grid1_grid2;
var
 i:integer;
begin
Edit6.text:=DM.ado105.FieldByName('voucher').asstring;     //凭证号
datetimepicker1.Date :=DM.ado105.fieldbyname('entered_dt').asdatetime;
edit5.Text :=DM.ado105.fieldbyname('attached').asstring;   //附件
edit1.Text :=DM.ado105.fieldbyname('FYEAR').asstring;      //会计年度
edit4.Text :=DM.ado105.fieldbyname('PERIOD').asstring;     //会计期间
Edit15.Text :=dm.Ado105employee_name.Value;//制单人
edit7.Text := dm.Ado105BATCH_NUMBER.Value;

 for i:=1 to sgrid1.RowCount-2 do
  begin
   sgrid1.Rows[i].Clear;
   sgrid2.Rows[i].Clear;
  end;

 sgrid1.RowCount:=dm.ADOQ0106.RecordCount+2;
 sgrid2.RowCount:=dm.ADOQ0106.RecordCount+2;

  DM.AdoQ0106.First ;
  for i:=1 to dm.ADOQ0106.RecordCount do
  begin
   sgrid1.Cells[0,i]:=
      DM.AdoQ0106.Fieldbyname('description').asstring;
    //保存科目指针
   sgrid1.Cells[1,i]:=
      trim(dm.ADOQ0106GL_ACC_NUMBER.Value)+'-'+ dm.ADOQ0106description_2.Value;

   sgrid1.Cells[2,i]:=dm.ADOQ0106curr_code.Value;

    if dm.ADOQ0106EXCH_RATE.Value > 0 then
     sgrid1.Cells[3,i]:= formatfloat('0.00000000',1/dm.ADOQ0106EXCH_RATE.Value)
    else
     sgrid1.Cells[3,i] := '0';

   sgrid1.Cells[4,i]:=formatfloat('0.00',dm.ADOQ0106PRICE.Value);
   if DM.AdoQ0106.Fieldbyname('d_c').asstring='D' then
    sgrid1.Cells[5,i]:=DM.AdoQ0106.Fieldbyname('AMOUNT').asstring
   else
    sgrid1.Cells[6,i]:=DM.AdoQ0106.Fieldbyname('AMOUNT').asstring;

   sgrid2.Cells[0,i]:=DM.AdoQ0106.Fieldbyname('RKEY').asstring;
   sgrid2.Cells[1,i]:=trim(DM.AdoQ0106.Fieldbyname('GL_ACCT_NO_PTR').asstring);
   sgrid2.Cells[2,i]:=dm.ADOQ0106CURR_PTR.AsString;     //保存货币指针
   DM.AdoQ0106.next;
  end;
  dm.ADOQ0106.First;
sgrid1.Row:=1;
recalculation();
end;

function TFrmAcctNote.vo_number(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0105');
  sql.Add('where VOUCHER='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;

function TFrmAcctNote.get_gltp(rkey103: string): integer;
begin
with dm.ADOQ do
 begin
  close;
  sql.Clear;
  sql.Add('select curr_tp from data0103');
  sql.Add('where rkey='+rkey103);
  open;
  result:=fieldbyname('curr_tp').AsInteger;
 end;
end;

function TFrmAcctNote.get_glcurr_ptr(rkey103: string): integer;
begin
with dm.ADOQ do
 begin
  close;
  sql.Clear;
  sql.Add('select curr_ptr from data0103');
  sql.Add('where rkey='+rkey103);
  open;
  result:=fieldbyname('curr_ptr').AsInteger;
 end;
end;

//生成Update SQL语句

function TFrmAcctNote.Get105UpdateSQl(const pDh:string):string;
var
 msql : string;
begin
   if trim(FrmAcctNote.edit5.Text)='' then FrmAcctNote.edit5.Text:='0';
   msql := 'update data0105'+#13
   +'set attached='+FrmAcctNote.edit5.Text+','+#13    //附件张数
   +' entered_by_empl_ptr='+TRIM(user_ptr)+','+#13   //制单人
   +' entered_dt='+QuotedStr(datetostr(datetimepicker1.Date))+','+#13 //制单日期
   +' FYEAR='+edit1.Text+','+#13       //会计年度
   +' period='+edit4.Text+','+#13      //会计期
   +' BATCH_NUMBER='+QuotedStr(edit7.Text)+#13      //参考号
   +' where  voucher ='+''''+pDh+'''';

  result:=msql;
end;

//修改
{sgrid2:|  0  |    1   |    2   |}
{      106RKey 科目指针 货币指针 }
procedure TFrmAcctNote.UpdateAcct();
var
 mCOM:TADOCommand;
 i:integer;
 msql:string;
begin

  mCOM := TADOCommand.Create(Application);
  mcom.Connection :=dm.ADOConnection1 ;
  mcom.CommandType :=cmdText;
  mcom.CommandText :=Get105UpdateSQl(edit6.text); //生成data0105 SQL语句

  mcom.Execute;

  msql :='DELETE data0106';          //删除data0106
  msql :=msql+' where  GL_HEADER_PTR ='+dm.Ado105.fieldbyname('rkey').asstring;
  mcom.CommandText :=msql;
  mcom.Execute;

   for i:=1 to sgrid1.RowCount-2 do //生成data0106 SQL语句
    begin
     msql :='insert data0106';
     msql :=msql+' (';   //凭证号指针、科目指针、摘要、金额、记帐方向、货币指针,汇率,原币金额
     msql :=msql+' GL_HEADER_PTR,GL_ACCT_NO_PTR,DESCRIPTION,AMOUNT,D_C,CURR_PTR,exch_rate,price';
     msql :=msql+' )';
     msql :=msql+' values';
     msql :=msql+' (';
     msql :=msql+dm.Ado105.fieldbyname('rkey').asstring+',';
     msql :=msql+sgrid2.Cells[1,i]+',';                 //科目
     msql :=msql+''''+sgrid1.Cells[0,i]+''''+',';       //摘要
    if trim(sgrid1.Cells[5,i])<>'' then                 //借方
     begin
      msql :=msql+sgrid1.Cells[5,i]+',';                //本币
      msql :=msql+''''+'D'+''''+',';
     end
    else
     begin
      msql :=msql+sgrid1.Cells[6,i]+',';
      msql :=msql+''''+'C'+''''+',';
     end;
    msql :=msql+sgrid2.Cells[2,i]+',';
    if strtofloat('0'+sgrid1.Cells[3,i]) > 0 then
     msql := msql+Floattostrf(1/strtofloat('0'+sgrid1.Cells[3,i]),ffFixed,12,8)+','
    else
     msql := msql+'0'+',';
    if trim(sgrid1.Cells[4,i])<>'' then
     msql := msql+sgrid1.Cells[4,i]+' )'
    else
     msql := msql+'0'+' )';
    mcom.CommandText := msql;
    mcom.Execute;
   end;//for
  mcom.free; //释放资源
  
end;
//生成SQL语句

function TFrmAcctNote.Get105InsertSQl() :string;
var            //重新获取单号
 msql : string;
begin
  msql :='insert data0105';
  msql :=msql+' (';
      //凭证号、附件张数、凭证类型、制单人、制单日期、会计年度、会计期间
  msql :=msql+'voucher,attached,trans_type,entered_by_empl_ptr,entered_dt,FYEAR,period,vou_type';
  msql :=msql+' )';
  msql :=msql+' values';
  msql :=msql+' (';
  msql :=msql+''''+FrmAcctNote.edit6.Text+''''+',';
  msql :=msql+''''+FrmAcctNote.edit5.Text+''''+',';
  msql :=msql+'9'+',';
  msql :=msql+TRIM(user_ptr)+',';
  msql :=msql+''''+datetostr(datetimepicker1.Date)+''''+',';
  msql :=msql+edit1.Text+',' ;
  msql :=msql+edit4.Text+',';
  msql :=msql+'4';
  msql :=msql+' )';
  result:=msql;
end;

procedure TFrmAcctNote.calu();
begin
 if (trim((sgrid1.Cells[3,sgrid1.row]))='') or
    (StrToFloat(sgrid1.Cells[3,sgrid1.row])=0) then
 begin
   sgrid1.Cells[4,sgrid1.row]:= '0.00' ;
   Exit;
 end;

 if trim(sgrid1.Cells[4,sgrid1.row])<>'' then
 if (sgrid1.col=4) or (sgrid1.col=3) then
   if (trim(sgrid1.Cells[6,sgrid1.row])='') and (trim(sgrid1.Cells[5,sgrid1.row])='') then
     begin                                              //默认计算原币(借方)
      sgrid1.Cells[5,sgrid1.row] :=  //计算本位币
       formatfloat('0.00',StrToFloat(sgrid1.Cells[4,sgrid1.row])*StrToFloat(sgrid1.Cells[3,sgrid1.row]));
     end
   else
    begin
     if trim(sgrid1.Cells[5,sgrid1.row])<>'' then           //计算借方
      begin
       sgrid1.Cells[5,sgrid1.row] :=
       formatfloat('0.00',StrToFloat(sgrid1.Cells[4,sgrid1.row])*StrToFloat(sgrid1.Cells[3,sgrid1.row]));
      end
     else
      begin
       sgrid1.Cells[6,sgrid1.row] :=
       formatfloat('0.00',StrToFloat(sgrid1.Cells[4,sgrid1.row])*StrToFloat(sgrid1.Cells[3,sgrid1.row]));
      end;
    end;//else
           //原币=借(贷)方/汇率
  if  (sgrid1.col=5) and (trim(sgrid1.Cells[5,sgrid1.row])<>'') then
   sgrid1.Cells[4,sgrid1.row] :=
    formatfloat('0.00',StrToFloat(sgrid1.Cells[5,sgrid1.row])/StrToFloat(sgrid1.Cells[3,sgrid1.row]));

  if (sgrid1.col=6) and (trim(sgrid1.Cells[6,sgrid1.row])<>'') then//计算原币(贷方)
   sgrid1.Cells[4,sgrid1.row] :=
    formatfloat('0.00',StrToFloat(sgrid1.Cells[6,sgrid1.row])/StrToFloat(sgrid1.Cells[3,sgrid1.row]));
end;

procedure TFrmAcctNote.DrawGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IF acol=1 then canselect:=false;
end;

procedure TFrmAcctNote.sgrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var s:string;
   iL,i,j:integer;
begin
 If arow=0 then
  begin
   If acol<=3 then
    sgrid1.Canvas.TextRect(rect,rect.Left+(rect.right-sgrid1.Canvas.TextWidth(sgrid1.Cells[acol,arow])-rect.Left) div 2,
        rect.Top+2, sgrid1.Cells[aCol,aRow]	)
   else
    sgrid1.Canvas.TextRect(rect,rect.right-sgrid1.Canvas.TextWidth(sgrid1.Cells[aCol,aRow])-2,
        rect.Top+2, sgrid1.Cells[aCol,aRow]	);
    exit;
  end;
  if (ARow>0) and (ACol=1)  then
   begin
    s:=trim(sgrid1.cells[acol,arow]);
    iL:=25;
    if length(s)>iL then
     begin
      for i:=iL downto 1 do if  windows.IsDBCSLeadByte(Byte(s[i])) then inc(j);
      if j mod 2<>0 then iL:=iL-1;
      sgrid1.canvas.Rectangle(rect);
      sgrid1.canvas.TextOut(rect.Left ,rect.Top,copy(s,1,iL));
      sgrid1.canvas.TextOut(rect.Left ,rect.Top+20,copy(s,iL+1,length(s)-iL));
     end
   end;

  If acol>3 then
  if trim(sgrid1.Cells[aCol,aRow])<>'' then
   sgrid1.Canvas.TextRect(rect,rect.right-sgrid1.Canvas.TextWidth(format('%.2f',[strtofloat(sgrid1.Cells[aCol,aRow])]))-2,
     rect.Top+2, format('%.2f',[strtofloat(sgrid1.Cells[aCol,aRow])])	);
end;

procedure TFrmAcctNote.sgrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if (ARow=sgrid1.RowCount-1) or (not speedbutton9.Enabled) then
 begin
  speedbutton2.Enabled:=false;
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
 end
else
 begin
  speedbutton2.Enabled:=true;
  speedbutton3.Enabled:=true;
  speedbutton4.Enabled:=true;
  speedbutton5.Enabled:=true;
  speedbutton6.Enabled:=true;
 end;

if (acol=1) or (acol=2) or (ARow=sgrid1.RowCount-1) then
 sgrid1.Options:=sgrid1.Options-[goEditing]
else
 sgrid1.Options:=sgrid1.Options+[goEditing];

 try
  if sgrid1.row<> sgrid1.Rowcount-1 then  calu;   //计算本币
  recalculation();
 except
    on E: Exception do showmessage(E.Message);
 end;

end;

procedure TFrmAcctNote.N1Click(Sender: TObject);//增加科目
begin
try
FrmAcctSearch:=TFrmAcctSearch.Create(application);
if FrmAcctSearch.ShowModal=mrok then
 begin
  try //选择货币
  Form_Curr:=tForm_Curr.Create(application);
  if (dm.ADOData0103CURR_TP.Value=0) then
    Form_Curr.ADOQuery1.Locate('rkey',1,[]);
  if (dm.ADOData0103CURR_TP.Value = 2) then
    Form_Curr.ADOQuery1.Locate('rkey',dm.ADOData0103curr_ptr.Value,[]);
  //if Form_Curr.ShowModal=mrok then
   begin
    if (dm.ADOData0103CURR_TP.Value=0) and
      (Form_Curr.ADOQuery1rkey.Value>1) then
    begin
     messagedlg('科目不允许核算外币',mterror,[mbcancel],0);
     exit;
    end;

    if (dm.ADOData0103CURR_TP.Value = 2) and
       (dm.ADOData0103curr_ptr.Value <> Form_Curr.ADOQuery1rkey.Value) then
    begin
     messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0);
     exit;
    end;

    sgrid1.RowCount := sgrid1.RowCount+1;
    sgrid2.RowCount := sgrid2.RowCount+1;
    if length(trim(dm.ADOData0103GL_ACC_NUMBER.Value)+'-'+trim(dm.ADOData0103description_2.Value))>24 then
      sgrid1.DefaultRowHeight:=34;
    if sgrid1.Rowcount>3 then       //摘要
     sgrid1.Cells[0,sgrid1.RowCount-2]:=trim(sgrid1.Cells[0,sgrid1.Rowcount-3]);

    sgrid1.Cells[1,sgrid1.RowCount-2]:=      //科目代码、名称
      trim(dm.ADOData0103GL_ACC_NUMBER.Value)+'-'+
      trim(dm.ADOData0103description_2.Value);

    sgrid1.Cells[2,sgrid1.RowCount-2] := Form_Curr.ADOQuery1curr_code.Value;
    sgrid1.Cells[3,sgrid1.RowCount-2] := Form_Curr.ADOQuery1base_TO_other.asstring;//汇率

    sgrid2.Cells[1,sgrid2.RowCount-2] := dm.ADOData0103rkey.AsString;     //科目指针
    sgrid2.Cells[2,sgrid2.RowCount-2] := Form_Curr.ADOQuery1rkey.AsString;//货币指针

    SpeedButton2.Enabled :=true;//使某些功能显示
    SpeedButton3.Enabled :=true;
    SpeedButton4.Enabled :=true;
    SpeedButton5.Enabled :=true;
    SpeedButton6.Enabled :=true;

  end;
  finally
   Form_Curr.free;
  end;
 end;
finally
 if dm.adodata0103.Filter<>'' then
  dm.adodata0103.Filter :='';
 dm.ADOData0103.Close;
 FrmAcctSearch.free;
end;

end;

procedure TFrmAcctNote.N3Click(Sender: TObject); //更改货币
begin
try
Application.CreateForm(TForm_Curr, Form_Curr);
 if Form_Curr.ShowModal=mrok then
  begin
   if (get_gltp(trim(sgrid2.Cells[1,sgrid1.row]))=0) and
      (Form_Curr.ADOQuery1rkey.Value>1) then
    begin
      messagedlg('科目不允许核算外币',mterror,[mbcancel],0);
      exit;
    end;

    if (self.get_gltp(trim(sgrid2.Cells[1,sgrid1.row]))=2) and   //单一外货
       (self.get_glcurr_ptr(trim(sgrid2.Cells[1,sgrid1.row]))<>
       Form_Curr.ADOQuery1rkey.Value) then
     begin
      messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0);
      exit;
     end;
     //币种
    sgrid2.Cells[2,sgrid1.Row]:=Form_Curr.ADOQuery1rkey.AsString;
    sgrid1.Cells[2,sgrid1.Row]:=Form_Curr.ADOQuery1curr_code.Value;
    sgrid1.Cells[3,sgrid1.Row]:=Form_Curr.ADOQuery1base_TO_other.AsString;
  end;
finally
 Form_Curr.free;
end; 
end;

//删除分录
procedure TFrmAcctNote.N2Click(Sender: TObject);
var i,J:integer;
begin
  if sgrid1.Rowcount=2 then
   begin
    SpeedButton2.Enabled :=false;
    SpeedButton3.Enabled :=false;
    SpeedButton4.Enabled :=false;
    exit;
   end;
  if messagedlg('确认要删除该项分录吗？',mtconfirmation,[mbyes,mbNo],0)<>mrYes then exit;

  //DM.AdoQ0106.MoveBy(sgrid1.Row-DM.AdoQ0106.recno);
  //DM.AdoQ0106.delete;
  for i:=sgrid1.Row to sgrid1.Rowcount-2 do
  begin
    for J := 0 to sgrid1.ColCount - 1 do
    begin
      sgrid1.Cells[J,I] := sgrid1.Cells[J,I + 1];
    end;
    for J := 0 to sgrid2.ColCount - 1 do
    begin
      sgrid2.Cells[J,I] := sgrid2.Cells[J,I+1];
    end;
//    sgrid1.rows[i].Text :=sgrid1.rows[i+1].Text ;
//    sgrid2.rows[i].Text :=sgrid2.rows[i+1].Text ;
  end;
  sgrid1.Rowcount:=sgrid1.Rowcount-1;
  sgrid2.Rowcount:=sgrid2.Rowcount-1;

  recalculation();

end;

procedure TFrmAcctNote.sgrid1KeyPress(Sender: TObject; var Key: Char);
begin
// if sgrid1.RowCount=2 then abort;
  if sgrid1.Col>2 then
  if not (key in ['0'..'9','.','-',#13,#8]) then
    abort
  else
  begin
   if (key = chr(46)) then
    if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0
     then
      abort;
    if sgrid1.col=5 then sgrid1.Cells[6,sgrid1.Row]:='';
    if sgrid1.col=6 then sgrid1.Cells[5,sgrid1.Row]:='';
  end;
end;
//合计

procedure TFrmAcctNote.FormActivate(Sender: TObject);
begin
  recalculation();
end;

procedure TFrmAcctNote.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then  abort
end;

procedure TFrmAcctNote.FormShow(Sender: TObject);
begin
  sgrid1.cells[0,0]:='摘    要';
  sgrid1.cells[1,0]:='科目代号/名称';
  sgrid1.cells[2,0]:='币种';
  sgrid1.cells[3,0]:='汇率';
  sgrid1.cells[4,0]:='原币金额';
  sgrid1.cells[5,0]:='借方(本币)金额';
  sgrid1.cells[6,0]:='贷方(本币)金额';
//  Application.CreateForm(TFrmAcctSearch, FrmAcctSearch);
end;

procedure TFrmAcctNote.sgrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 v_c:currency;
begin
//  if sgrid1.Col=0 then
//   if key=vk_right then
//    sgrid1.Col:=3;
//  if sgrid1.Col=3 then
//   if key=vk_left then
//    sgrid1.Col:=0;

if key=13 then    //用户按下回车键,左右对调
 begin
  if sgrid1.Row<> sgrid1.RowCount-1 then
  begin
   if (sgrid1.Col=5) and (sgrid1.Cells[6,sgrid1.Row]<>'') then
    begin
    sgrid1.Cells[5,sgrid1.Row]:=sgrid1.Cells[6,sgrid1.Row];
    sgrid1.Cells[6,sgrid1.Row]:='';
    end;
   if (sgrid1.Col=6) and (sgrid1.Cells[5,sgrid1.Row]<>'') then
    begin
    sgrid1.Cells[6,sgrid1.Row]:=sgrid1.Cells[5,sgrid1.Row];
    sgrid1.Cells[5,sgrid1.Row]:='';
    end;

  self.recalculation;
  end;
 end;

if key=187 then    //用户按下=键,自动计算
 begin
  if sgrid1.Row <> sgrid1.RowCount-1 then
  begin

   if (sgrid1.Col=5) and (sgrid1.Cells[6,sgrid1.Row]='') then
   begin
    v_c:=strtocurr(edit3.text)-get_col5(sgrid1.Row);
    if v_c <> 0 then
     sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',v_c);
   end;

   if (sgrid1.Col=6) and (sgrid1.Cells[5,sgrid1.Row]='') then
   begin
    v_c:=strtocurr(edit2.text)-get_col6(sgrid1.Row);
    if v_c <> 0 then
    sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',v_c);
   end;

   self.recalculation;
  end;
 end;
 
end;

procedure TFrmAcctNote.N5Click(Sender: TObject);  //摘要
begin
 Application.CreateForm(TFrmDictionary, FrmDictionary);
 if FrmDictionary.ShowModal=mrok then
  sgrid1.Cells[0,sgrid1.Row]:=trim(FrmDictionary.adodata0513.Fieldbyname('description').asstring);
 FrmDictionary.free;
end;

procedure TFrmAcctNote.N7Click(Sender: TObject); //复制摘要
begin
 if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0, sgrid1.Row]:=sgrid1.Cells[0, sgrid1.Row-1];
end;

procedure TFrmAcctNote.PopupMenu1Popup(Sender: TObject);
begin
  if sgrid1.row=sgrid1.RowCount-1 then
  begin
    n2.Enabled :=false;
    n3.Enabled :=false;
    n5.Enabled :=false;
    n6.Enabled :=false;
    n7.Enabled :=false;
  end else
  begin
    n2.Enabled :=true;
    n3.Enabled :=true;
    n5.Enabled :=true;
    n6.Enabled :=true;
    n7.Enabled :=true;
  end;
 n10.Visible:=ttype.Caption='0';
end;

procedure TFrmAcctNote.SpeedButton8Click(Sender: TObject);//退出
begin
 if (strtoint(ttype.Caption)=1) and (self.edit_flag) then  //编辑状态下
  begin
   if messagedlg('你确定不保存当前的数量退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
    close;
  end
 else
 if (strtoint(ttype.Caption)=0) and (sgrid1.RowCount>2) then
  begin
   if messagedlg('你确定不保存当前的数量退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
    close;
  end
 else
 close;
end;
//保存
procedure TFrmAcctNote.SpeedButton9Click(Sender: TObject);
var
  i,mrkey:integer;
  mCOM:TADOCommand;
  msql: string;
  b,b1:boolean;
begin
 if ActiveControl.Name='sgrid1' then  sgrid1Exit(Sender);
 if strtocurr(edit3.text)<>strtocurr(edit2.Text) then
  begin
   messagedlg('借方金额同贷方金额不相等！',mtinformation,[mbok],0);
   exit;
  end;

 if sgrid1.Rowcount=2 then
  begin
   messagedlg('没有记录可以保存！',mtinformation,[mbok],0);
   exit;
  end;

  for i:=0 to sgrid1.Rowcount-2 do
   if (trim(sgrid1.Cells[5,i])='') and (trim(sgrid1.Cells[6,i])='') then
    begin
     messagedlg('不能有空记录！',mtinformation,[mbok],0);
     exit;
    end;

    dm.ADOQuery1.Close;
    dm.ADOQuery1.SQL.Text:='select top 1 rkey from data0105 '+                               //结转成本生成
        'where FYEAR='+edit1.Text+' and PERIOD='+edit4.Text +' and status=3 and SPECIAL_POSTING =''A''';
    dm.ADOQuery1.Open;
    b:=not dm.ADOQuery1.IsEmpty;

    dm.ADOQuery1.Close;
    dm.ADOQuery1.SQL.Text:='select top 1 rkey from data0105 '+                               //结转损益生成
        'where FYEAR='+edit1.Text+' and PERIOD='+edit4.Text +' and status=3 and SPECIAL_POSTING =''Y''';
    dm.ADOQuery1.Open;
    b1:=not dm.ADOQuery1.IsEmpty;

  for i:=1 to sgrid1.RowCount-2 do
  begin
    if sgrid1.Cells[1,i]='' then
    begin
      messagedlg('请输入会计科目！',mtinformation,[mbok],0);
      exit;
    end;


    if b then //已经结转成本费用
    begin
      dm.ADOQuery1.Close;
      dm.ADOQuery1.SQL.Text:='select rkey from data0103 where rkey='+sgrid2.Cells[1,i]+' and acc_tp=4';
      dm.ADOQuery1.Open;
      if  not dm.ADOQuery1.IsEmpty  then
      begin
        if (MessageBox(self.Handle,pchar('本期已结转成本费用,是否继续输入本期费用类凭证?'),pchar('提示'),MB_YESNO+MB_ICONINFORMATION)<>IDYES) then
          exit
        else
         begin
          b:=false;
          continue;
         end;
      end;
    end;

    if b1 then //已经结转本期损益
    begin
      dm.ADOQuery1.Close;
      dm.ADOQuery1.SQL.Text:='select rkey from data0103 where rkey='+sgrid2.Cells[1,i]+' and acc_tp=5';
      dm.ADOQuery1.Open;
      if  not dm.ADOQuery1.IsEmpty then
      begin
        if (MessageBox(self.Handle,pchar('本期已结转损益,是否继续输入本期损益类凭证?'),pchar('提示'),MB_YESNO+MB_ICONINFORMATION)<>IDYES) then
          exit
        else
          b1:=false;
      end;
    end;
  end;

  //*************已经结帐不能作凭证*****************//
  if dm.ADOData0508INITIALIZED.Value=0 then
    begin
     messagedlg('会计期间没有初始化！',mtinformation,[mbok],0);
     exit;
    end
  else
    begin
     if (DM.ADOData0508CURR_FYEAR.Value > strtoint(edit1.text)) or
        ((DM.ADOData0508CURR_FYEAR.Value >= strtoint(edit1.text)) and
        (DM.ADOData0508CURR_PERIOD.Value > strtoint(edit4.text))) then
      begin
       messagedlg('凭证年度或者期间小于当前会计年度或者期间!',mterror,[mbcancel],0);
       exit;
      end;

     if strtoint(Edit4.Text) <> monthof(datetimepicker1.date) then
      begin
       messagedlg('凭证期间不等于凭证日期的会计期间请修改!',mterror,[mbcancel],0);
       datetimepicker1.setfocus;
       exit;
      end;
    end;

    if FrmMain._isEdit=False then      //新增
    if self.vo_number(trim(edit6.Text)) then
    begin
     edit6.Text:=FrmMain.get_vouchernumber(self.DateTimePicker1.Date);
     messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号:'+edit6.Text,mterror,[mbcancel],0);
    end;

  dm.ADOConnection1.BeginTrans ;

  if FrmMain._isEdit=true then //修改
  begin
   try
    UpdateAcct;   //修改
    dm.ADOConnection1.CommitTrans;
    mrkey:=DM.Ado105RKEY.AsInteger ;
    dm.Ado105.close;
    dm.Ado105.Open;
    DM.Ado105.Locate('RKEY',mrkey,[]);
    messagedlg('保存成功！',mtinformation,[mbok],0);
    IF CheckBox1.Checked=true  THEN   //列印记帐凭证
     self.report_print(dm.Ado105rkey.Value);
   except
    on E: Exception do
    BEGIN
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mtinformation,[mbok],0);
    end;
   end;
  end
  else
   begin

   try
   dm.adoq.Close ;
   dm.ADOQ.SQL.Clear;
   dm.adoq.sql.text:='select * from data0105 where rkey is null';
   dm.adoq.Open;           //获取主从表指针
   dm.ADOQ.Append;
   dm.ADOQ.FieldValues['voucher']:=edit6.Text;
   dm.ADOQ.FieldValues['attached']:=strtoint(edit5.Text);
   dm.ADOQ.FieldValues['trans_type']:=9;
   dm.ADOQ.FieldValues['entered_by_empl_ptr']:=user_ptr;
   dm.ADOQ.FieldValues['entered_dt']:=datetimepicker1.Date;
   dm.ADOQ.FieldValues['FYEAR']:=strtoint(edit1.Text);
   dm.ADOQ.FieldValues['period']:=strtoint(edit4.Text);
   dm.ADOQ.FieldValues['vou_type']:=4;
   dm.ADOQ.FieldValues['BATCH_NUMBER']:=edit7.Text;
   dm.ADOQ.Post;

   //凭证号、附件张数、凭证类型、制单人、制单日期、会计年度、会计期间

    mCOM := TADOCommand.Create(Application);
    mcom.Connection :=dm.ADOConnection1 ;
    mcom.CommandType :=cmdText;

    for i:=1 to sgrid1.RowCount-2 do  //生成data0106 SQL语句
     begin
      msql :='insert data0106';
      msql :=msql+' ('; //凭证号指针、科目指针、摘要、金额、记帐方向,货币指针,汇率,原币金额
      msql :=msql+' GL_HEADER_PTR,GL_ACCT_NO_PTR,DESCRIPTION,AMOUNT,D_C,CURR_PTR,EXCH_RATE,PRICE';
      msql :=msql+' )';
      msql :=msql+' values';
      msql :=msql+' (';
      msql :=msql+dm.adoq.fieldbyname('rkey').asstring+',';
      msql :=msql+sgrid2.Cells[1,i]+',';  //科目
      msql :=msql+''''+sgrid1.Cells[0,i]+''''+',';  //摘要

      if trim(sgrid1.Cells[5,i])<>'' then              //借方
       begin
        msql :=msql+sgrid1.Cells[5,i]+',';                //本币
        msql :=msql+''''+'D'+''''+',';
       end
      else                                            //贷方
       begin
        msql :=msql+sgrid1.Cells[6,i]+',';
        msql :=msql+''''+'C'+''''+',';
       end;
       msql :=msql+sgrid2.Cells[2,i]+',';     //货币指针
       if strtofloat('0'+sgrid1.Cells[3,i])>0 then
        msql := msql+Floattostrf(1/strtofloat('0'+sgrid1.Cells[3,i]),ffFixed,12,8)+','
       else
        msql := msql+'0'+',';
       if trim(sgrid1.Cells[4,i])<>'' then
         msql := msql+sgrid1.Cells[4,i]+' )'
       else
         msql := msql+'0'+' )';
       mcom.CommandText := msql;
       mcom.Execute;
     end;//for
  dm.ADOConnection1.CommitTrans ;
  mcom.free; //释放资源
  messagedlg('保存成功！',mtinformation,[mbok],0);
  sgrid1.DefaultRowHeight:=19;
  dm.Ado105.Close;
  dm.Ado105.Open;
  dm.Ado105.Locate('rkey',dm.ADOQ.FieldValues['rkey'],[]);
  except
   on E: Exception do
    BEGIN
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mtinformation,[mbok],0);
    end;
  end;
   //*************完成提交数据*****************//

  IF CheckBox1.Checked=true  THEN //列印记帐凭证
   begin
    self.report_print(dm.ADOQ.FieldValues['rkey']);
   end;

//   datetimepicker1.date:=FrmMain.sys_sortdate;
   edit1.text:=inttostr(yearof(datetimepicker1.date)) ; //会计年度
   edit4.text:=inttostr(monthof(datetimepicker1.date)); //会计月份

   edit6.Text:=FrmMain.get_vouchernumber(self.DateTimePicker1.Date);
   edit2.text:='0.00';
   edit3.text:='0.00';
   edit5.text:='0';

   for i:=1 to sgrid1.RowCount-2 do
    begin
     sgrid1.Rows[i].Clear;
     sgrid2.Rows[i].Clear;
    end;
    sgrid1.RowCount:=2;
    sgrid2.RowCount:=2;

    sgrid1.SetFocus;
  end;
  //*************提交数据*****************//
end;

procedure TFrmAcctNote.sgrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column, row:longint;//右键选择stringgrid控件的方法
begin

if button=mbright then
 begin
   sgrid1.MouseToCell(x, y, column ,row);
   if row<>0 then
   begin
    sgrid1.Row:=row;
    sgrid1.Col:=column;
   end;
 end;

end;

//修改科目
procedure TFrmAcctNote.N6Click(Sender: TObject);
begin
try
 FrmAcctSearch:=TFrmAcctSearch.Create(application);
 if FrmAcctSearch.ShowModal=mrok then
  begin
   if (dm.ADOData0103curr_tp.Value=0) and
      (strtoint(sgrid2.Cells[2,sgrid1.Row])>1) then
    messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
   else
    if (dm.ADOData0103curr_tp.Value=2) and
       (dm.ADOData0103curr_ptr.Value<>strtoint(sgrid2.Cells[2,sgrid1.Row])) then
     messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
    else
     begin
      sgrid1.Cells[1,sgrid1.Row]:=
       dm.ADOData0103GL_ACC_NUMBER.Value+'-'+
       trim(dm.ADOData0103DESCRIPTION_2.Value);
      sgrid2.Cells[1,sgrid1.Row]:=dm.ADOData0103rkey.AsString;  //科目指针
     end;
  end;
finally
 if dm.adodata0103.Filter<>'' then
  dm.adodata0103.Filter :='';
 dm.ADOData0103.Close;
 FrmAcctSearch.Free;
end;
end;

//改变凭证号、会计期间
procedure TFrmAcctNote.sgrid1Exit(Sender: TObject);
begin
if (sgrid1.col>=3) and (sgrid1.row<> sgrid1.Rowcount-1) then
 begin
  calu;   //计算本币
  recalculation();  //计算借贷汇总
 end;
end;

//打印
procedure TFrmAcctNote.SpeedButton7Click(Sender: TObject);
begin
self.report_print(dm.Ado105rkey.Value);
end;

procedure TFrmAcctNote.DateTimePicker1Exit(Sender: TObject);
begin
if not FrmMain._isEdit then //新增
begin
 edit1.Text:=inttostr(yearof(datetimepicker1.Date));
 Edit4.Text:=inttostr(monthof(datetimepicker1.Date));
 edit6.Text:=FrmMain.get_vouchernumber(self.DateTimePicker1.Date);
end;
end;

function TFrmAcctNote.get_col5(row: integer): currency;
var
 i:integer;
begin
result:=0;
 for i:=1 to sgrid1.RowCount-2 do
  begin
   if (trim(sgrid1.Cells[5,i])<>'') and (i<>row) then
   result:=result+strtocurr(sgrid1.Cells[5,i]);
  end;
end;

function TFrmAcctNote.get_col6(row: integer): currency;
var
 i:integer;
begin
result:=0;
 for i:=1 to sgrid1.RowCount-2 do
  begin
   if (trim(sgrid1.Cells[6,i])<>'') and (i<>row) then
   result:=result+strtocurr(sgrid1.Cells[6,i]);
  end;
end;

procedure TFrmAcctNote.N8Click(Sender: TObject);
var
 i:integer;
begin
try
FrmAcctSearch:=TFrmAcctSearch.Create(application);
if FrmAcctSearch.ShowModal=mrok then
 begin
  try //选择货币
  Form_Curr:=tForm_Curr.Create(application);
  if Form_Curr.ShowModal=mrok then
   begin
   if (dm.ADOData0103CURR_TP.Value=0) and
     (Form_Curr.ADOQuery1rkey.Value>1) then
   begin
    messagedlg('科目不允许核算外币',mterror,[mbcancel],0);
    exit;
   end;

   if (dm.ADOData0103CURR_TP.Value=2) and
     (dm.ADOData0103curr_ptr.Value<>Form_Curr.ADOQuery1rkey.Value) then
   begin
    messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0);
    exit;
   end;

   for i:=sgrid1.RowCount-1 downto sgrid1.Row+1 do
    begin
     sgrid1.Rows[i]:=sgrid1.Rows[i-1];
     sgrid2.Rows[i]:=sgrid2.Rows[i-1];
    end;

    if sgrid1.Rowcount>3 then       //摘要
     sgrid1.Cells[0,sgrid1.Row]:=trim(sgrid1.Cells[0,sgrid1.Row-1])
    else
     sgrid1.Cells[0,sgrid1.Row]:='';

    sgrid1.Cells[1,sgrid1.Row]:=      //科目代码、名称
     trim(dm.adodata0103.Fieldbyname('gl_acc_number').asstring)+'-'+
   //  trim(dm.adodata0103.Fieldbyname('gl_description').asstring)+
     trim(dm.adodata0103.Fieldbyname('DESCRIPTION_2').asstring);

   sgrid1.Cells[2,sgrid1.Row]:=Form_Curr.ADOQuery1curr_code.Value;
   sgrid1.Cells[3,sgrid1.Row]:=Form_Curr.ADOQuery1base_TO_other.asstring;  //汇率
   sgrid1.Cells[4,sgrid1.Row]:='';
   sgrid1.Cells[5,sgrid1.Row]:='';
   sgrid1.Cells[6,sgrid1.Row]:='';

   sgrid2.Cells[0,sgrid1.Row]:='';
   sgrid2.Cells[1,sgrid1.Row]:=dm.ADOData0103rkey.AsString;  //科目指针
   sgrid2.Cells[2,sgrid1.Row]:=Form_Curr.ADOQuery1rkey.AsString;  //货币指针

   sgrid1.RowCount:=sgrid1.RowCount+1;
   sgrid2.RowCount:=sgrid2.RowCount+1;

   SpeedButton2.Enabled :=true;//使某些功能显示
   SpeedButton3.Enabled :=true;
   SpeedButton4.Enabled :=true;

  end;
  finally
   Form_Curr.free;
  end;
 end;
finally
 dm.adodata0103.Filter :='';
 FrmAcctSearch.free;
end;
end;

procedure TFrmAcctNote.SpeedButton10Click(Sender: TObject);
begin
if dm.Ado105.RecNo=1 then
 speedbutton10.Enabled:=false
else
 if (strtoint(ttype.Caption)=1) and (self.edit_flag) then  //编辑状态下
  begin
   if messagedlg('你确定不保存当前的数据吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
     dm.Ado105.Prior;
     self.update_grid1_grid2;
     if not speedbutton11.Enabled then speedbutton11.Enabled:=true;
     self.status_update;
    end;
  end
 else      //检查
  begin
   dm.Ado105.Prior;
   self.update_grid1_grid2;
   if not speedbutton11.Enabled then speedbutton11.Enabled:=true;
   self.status_update;
  end;
end;

procedure TFrmAcctNote.SpeedButton11Click(Sender: TObject);
begin
if dm.Ado105.RecNo=dm.Ado105.RecordCount then
 speedbutton11.Enabled:=false
else
 begin
  if (strtoint(ttype.Caption)=1) and (self.edit_flag) then  //编辑状态下
  begin
   if messagedlg('你确定不保存当前的数据吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
    begin
     dm.Ado105.next;
     self.update_grid1_grid2;
     if not speedbutton10.Enabled then speedbutton10.Enabled:=true;
     self.status_update;
    end;
  end
  else
  begin
   dm.Ado105.next;
   self.update_grid1_grid2;
   if not speedbutton10.Enabled then speedbutton10.Enabled:=true;
   self.status_update;
  end;
 end;
end;

procedure TFrmAcctNote.report_print(rkey105: integer);
begin
  Form_voucherreport:=TForm_voucherreport.create(application);
  Form_voucherreport.aqd105.Close;
  Form_voucherreport.aqd105.parameters[0].value:=rkey105;
  Form_voucherreport.aqd105.open;
  Form_voucherreport.aqd106.Open;
  Form_voucherreport.aqd493.open;
  Form_voucherreport.ppReport1.Reset;
  Form_voucherreport.ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'VOUCHER_REPORT.rtm';         //R:\NIERP\Report\VOUCHER_REPORT.rtm
  Form_voucherreport.ppReport1.Template.LoadFromFile;
  Form_voucherreport.ppReport1.SaveAsTemplate:=false;

  Form_voucherreport.ppreport1.print;
  Form_voucherreport.free;
end;

procedure TFrmAcctNote.Edit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edit5.Text)='' then edit5.Text:='0';
end;

procedure TFrmAcctNote.N10Click(Sender: TObject);
var
 i:integer;
begin
Form_vouchersearch:=tForm_vouchersearch.Create(application);
if Form_vouchersearch.ShowModal=mrok then
 begin
  if (sgrid1.RowCount > 2) and
     (messagedlg('复制凭证将清空原明细,继续吗?',mtconfirmation,[mbYes,mbNo],0)=mrno) then

  else
  begin
   for i:=1 to sgrid1.RowCount-2 do
    begin
     sgrid1.Rows[i].Clear;
     sgrid2.Rows[i].Clear;
    end;
   sgrid1.RowCount:=Form_vouchersearch.ads106.RecordCount+2;
   sgrid2.RowCount:=sgrid1.RowCount;

  Form_vouchersearch.ads106.First ;
  for i:=1 to Form_vouchersearch.ads106.RecordCount do
  begin
   sgrid1.Cells[0,i]:=Form_vouchersearch.ads106DESCRIPTION.Value;

   sgrid1.Cells[1,i]:=
      trim(Form_vouchersearch.ads106GL_ACC_NUMBER.Value)+'-'+
      Form_vouchersearch.ads106description_2.Value;

    sgrid1.Cells[2,i]:=Form_vouchersearch.ads106curr_code.Value;
    if Form_vouchersearch.ads106EXCH_RATE.Value > 0 then
     sgrid1.Cells[3,i]:= formatfloat('0.00000000',1/Form_vouchersearch.ads106EXCH_RATE.Value)
    else
     sgrid1.Cells[3,i] := '0';

   if Form_vouchersearch.CheckBox1.Checked then
    sgrid1.Cells[4,i]:=formatfloat('0.00',Form_vouchersearch.ads106fu_amount.Value*
                                   Form_vouchersearch.ads106EXCH_RATE.Value)
   else
    sgrid1.Cells[4,i]:=formatfloat('0.00',Form_vouchersearch.ads106AMOUNT.Value*
                                   Form_vouchersearch.ads106EXCH_RATE.Value);

   if Form_vouchersearch.ads106D_C.Value='D' then
    if Form_vouchersearch.CheckBox1.Checked then
     sgrid1.Cells[5,i]:=Form_vouchersearch.ads106fu_amount.AsString
    else
     sgrid1.Cells[5,i]:=Form_vouchersearch.ads106AMOUNT.AsString
   else
    if Form_vouchersearch.CheckBox1.Checked then
     sgrid1.Cells[6,i]:=Form_vouchersearch.ads106fu_amount.asstring
    else
     sgrid1.Cells[6,i]:=Form_vouchersearch.ads106AMOUNT.asstring;

   sgrid2.Cells[0,i]:=Form_vouchersearch.ads106RKEY.asstring;
   sgrid2.Cells[1,i]:=Form_vouchersearch.ads106GL_ACCT_NO_PTR.AsString;
   sgrid2.Cells[2,i]:=Form_vouchersearch.ads106CURR_PTR.AsString;
     //保存货币指针
   Form_vouchersearch.ads106.Next;
  end;
  Form_vouchersearch.ads106.First;
  sgrid1.Row:=1;
  recalculation();
  end;
 end;
Form_vouchersearch.Free;
end;

end.

