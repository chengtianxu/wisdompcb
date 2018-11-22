//////////////////////////////////////////////////////
//                   _ooOoo_                        //
//                  o8888888o                       //
//                  88" . "88                       //
//                  (| -_- |)                       //
//                  O\  =  /O                       //
//               ____/`---'\____                    //
//             .'  \\|     |//  `.                  //
//            /  \\|||  :  |||//  \                 //
//           /  _||||| -:- |||||-  \                //
//           |   | \\\  -  /// |   |                //
//           | \_|  ''\---/''  |   |                //
//           \  .-\__  `-`  ___/-. /                //
//         ___`. .'  /--.--\  `. . __               //
//      ."" '<  `.___\_<|>_/___.'  >'"".            //
//     | | :  `- \`.;`\ _ /`;.`/ - ` : | |          //
//     \  \ `-.   \_ __\ /__ _/   .-` /  /          //
//======`-.____`-.___\_____/___.-`____.-'======     //
//                   `=---='                        //
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^     //
//         佛祖保佑       永无BUG                   //
//*////////////////////////////////////////////////*//



unit main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,DateUtils, Grids, DBGridEh, StdCtrls, Buttons, ComCtrls,
  Menus, DB, DBClient,MIDAS,MidasLib, ADODB;
type
  TForm1 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    btn1: TBitBtn;
    btn3: TBitBtn;
    pnl4: TPanel;
    grp1: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    lbl5: TLabel;
    dtp1: TDateTimePicker;
    lbl6: TLabel;
    dtp2: TDateTimePicker;
    DBGridEh1: TDBGridEh;
    grp3: TGroupBox;
    chk0: TCheckBox;
    edit1: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    qry_cancel: TADOQuery;
    N8: TMenuItem;
    N9: TMenuItem;
    mniN10: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chk0Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure dtp2Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edit1Change(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure mniN10Click(Sender: TObject);
  private
    procedure Toproducesql();
    procedure ToproduceAudit(areq_rkey :Integer;areqtype :Integer);
    procedure ToproduceBack(breq_rkey :Integer;breqtype :Integer);
    function OpenQry(ssql:string):string;
  public
    { Public declarations }
    orginal_sql : string;
    reqtype_sql : string;
    reqstate_sql : string;
    temp_sql : string;
    ischecked_sql : string;
    datetime_sql :string;
    new_sql : string;
    UserRkey: Integer;
    UserName: string;
    PreColumn: TColumnEh;
    field_name:string;
  end;

var
  Form1: TForm1;

implementation

uses damo,common, ChaoKaFrm, RemarkFrm;

{$R *.dfm}

function TForm1.OpenQry(ssql:string):string;
var
  Errstr:string;
begin
 try
   result:='';
   with dm.tmp do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   open ;
   end;
  except on e:exception do
  begin
   Errstr:='错误：'+e.Message;
   ShowMessage(Errstr);
   //exit;
  end;
 end;
   result:=Errstr;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
 if not App_init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;

//
//   dm.ADOConnection1.Open;
//    rkey73:= '96';
//  user_ptr := '110';
//  vprev := '4';
//


      Caption := application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'YYYY-MM-DD';
  field_name := DBGridEh1.Columns[1].FieldName;
  PreColumn := DBGridEh1.Columns[1];
  DBGridEh1.Columns[1].Title.Color := clred ;
 label1.Caption:=DBGridEh1.Columns[1].Title.Caption;

  with DM.tmp do
  begin
    Close;
    SQL.Text := 'select data0005.rkey,data0005.employee_name from data0005 inner join data0073 '
      + 'on data0005.rkey=data0073.employee_ptr where data0073.rkey = '+ rkey73;
    Open;
    if not IsEmpty then
    begin
      UserRkey := FieldByName('rkey').AsInteger;
      UserName := Trim(FieldByName('employee_name').AsString);
    end;
  end;

  orginal_sql :=dm.cds1.CommandText;
  reqtype_sql :='';
  reqstate_sql :='';
  temp_sql :='';
  ischecked_sql :='';
  datetime_sql :='';
  dtp1.Date :=incday(Now,-3);
  dtp2.Date := Now;
  Toproducesql;

  if  not dm.cds1.Active   then
  begin
     dm.cds1.CommandText := new_sql;
     dm.cds1.Active;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.ToproduceAudit(areq_rkey:Integer;areqtype :Integer);
begin
   
   ShowMessage('1');
end;

procedure TForm1.ToproduceBack(breq_rkey:Integer;breqtype :Integer);
begin
   ShowMessage('2');
end;



procedure TForm1.Toproducesql;
begin
  //------------------------
   if CheckBox2.Checked  and CheckBox3.Checked and CheckBox4.Checked     //1
   then  reqtype_sql :=' ';
   if CheckBox2.Checked  and CheckBox3.Checked and (not CheckBox4.Checked)  //2
   then  reqtype_sql :=' and reqtype in (0,1) ';
   if CheckBox2.Checked  and (not CheckBox3.Checked) and (not CheckBox4.Checked)  //3
   then  reqtype_sql :=' and reqtype=0 ';
   if  (not CheckBox2.Checked)  and (not CheckBox3.Checked) and (not CheckBox4.Checked) //4
   then  reqtype_sql :=' and reqtype not in (0,1,2) ';
   if  (not CheckBox2.Checked)  and ( CheckBox3.Checked) and (CheckBox4.Checked)  //5
   then  reqtype_sql :=' and reqtype  in (1,2) ';
   if  (not CheckBox2.Checked)  and (not CheckBox3.Checked) and (CheckBox4.Checked)  //6
   then  reqtype_sql :=' and reqtype  =2 ';
   if  (not CheckBox2.Checked)  and ( CheckBox3.Checked) and ( not CheckBox4.Checked)//7
   then  reqtype_sql :=' and reqtype  =1 ';
   if  ( CheckBox2.Checked)  and ( not CheckBox3.Checked) and ( CheckBox4.Checked)//8
   then  reqtype_sql :=' and reqtype  in (0,2) ';
  //--------------------------------

   if RadioGroup1.ItemIndex = 1
    then reqstate_sql := ' and reqstate=2 ';
   if  RadioGroup1.ItemIndex = 0
    then reqstate_sql := ' and reqstate=1 ';
  if  RadioGroup1.ItemIndex =2
  then reqstate_sql := ' and reqstate=3 ';

  //-------------------------------------------
  datetime_sql :=  ' and reqtime between '+
    QuotedStr(FormatDateTime('yyyy-MM-dd',dtp1.date)) +
  ' and '+ QuotedStr(FormatDateTime('yyyy-MM-dd',dtp2.date)+' 23:59:59');

  new_sql := orginal_sql + reqtype_sql + reqstate_sql +  datetime_sql;


end;

procedure TForm1.FormShow(Sender: TObject);
begin
    RadioGroup1.Width := integer(Trunc(Panel2.Width*0.3));
    btn1.Click;
    //ShowMessage(UserName);
end;

procedure TForm1.chk0Click(Sender: TObject);
begin

  if chk0.Checked
  then
  begin
     DBGridEh1.DataSource.DataSet.First;
      while       not  DBGridEh1.DataSource.DataSet.Eof do
      begin
        DBGridEh1.DataSource.DataSet.Edit;
        DBGridEh1.DataSource.DataSet.FieldByName('selected').Value := True;

        DBGridEh1.DataSource.DataSet.Next;
      end;
  end
  else
  begin
         DBGridEh1.DataSource.DataSet.First;
      while       not  DBGridEh1.DataSource.DataSet.Eof do
      begin
        DBGridEh1.DataSource.DataSet.Edit;
        DBGridEh1.DataSource.DataSet.FieldByName('selected').Value:= false;
        DBGridEh1.DataSource.DataSet.Next;
      end;
  end; 
end;



procedure TForm1.CheckBox2Click(Sender: TObject);
begin
if dm.cds1.IndexName<>'' then
begin
 dm.cds1.DeleteIndex(dm.cds1.IndexName);
end;
  if dm.cds1.Active then dm.cds1.Active := False;
  Toproducesql;
  dm.cds1.CommandText := new_sql;
  dm.cds1.Active := True;
  lbl2.Caption := IntToStr(dm.cds1.RecordCount);
  
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  {set @req_rkey =:req_rkey
    set  @reqtype=:req_type
    set @o per_rkey=:oper_rkey
    set @oper_name=:oper_name
   }
   //当多选的时候此流程
   if (Tmenuitem(Sender).Tag in [0,3]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  Form1.Enabled := false;
    try
      DBGridEh1.DataSource.DataSet.First;
     while not DBGridEh1.DataSource.DataSet.Eof do
      begin
        dm.qry_adupro.Close;
        dm.qry_adupro.Parameters[0].Value := dm.cds1rkey.AsInteger;
        dm.qry_adupro.Parameters[1].Value := dm.cds1reqtype.AsInteger;
        dm.qry_adupro.Parameters[2].Value :=  UserRkey;
        dm.qry_adupro.Parameters[3].Value :=  UserName;
       if (DBGridEh1.DataSource.DataSet.FieldByName('selected').Value= true)
         and (DBGridEh1.DataSource.DataSet.FieldByName('reqstate').Value=1)
       then
       dm.qry_adupro.ExecSQL;
       DBGridEh1.DataSource.DataSet.Next;
       Application.ProcessMessages;
      end;
      //当单选的时候，应该用临时表     ,批处理，待续
      btn1.Click;
      Form1.Enabled := True;
     except
        Form1.Enabled := True;
     end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
  LFrm:TfrmNote;
  LBackStr:string;
begin
if (Tmenuitem(Sender).Tag in [0,3]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  LBackStr:= '';
  LFrm:= TfrmNote.Create(Application);
  try
    if LFrm.ShowModal = mrOk then LBackStr:= LFrm.mmo1.Text;
  finally
    LFrm.free;
  end;

  DBGridEh1.DataSource.DataSet.First;
 while not DBGridEh1.DataSource.DataSet.Eof do
  begin
   if (DBGridEh1.DataSource.DataSet.FieldByName('selected').Value= true)
     and (DBGridEh1.DataSource.DataSet.FieldByName('reqstate').Value=1)
   then
   begin
    dm.tmp.Close;
    dm.tmp.SQL.Clear;
    dm.tmp.SQL.Text := ' update req set reqstate=3,dealperson='+quotedstr(UserName)+
                ' ,ReqInfo= ReqInfo + ''   退回原因：'' + ' + QuotedStr(LBackStr) +
                ' from req where rkey='+inttostr(dm.cds1rkey.Value) ;
    ShowMessage(dm.tmp.SQL.Text);
    dm.tmp.ExecSQL;
   end;
   DBGridEh1.DataSource.DataSet.Next;
  end;
  //当单选的时候，应该用临时表     ,批处理，待续
  btn1.Click;

end;


procedure TForm1.btn1Click(Sender: TObject);
begin
  if dm.cds1.IndexName<>'' then
begin
 dm.cds1.DeleteIndex(dm.cds1.IndexName);
end;
  if dm.cds1.Active then dm.cds1.Active := False;
  Toproducesql;
  dm.cds1.CommandText := new_sql;
  dm.cds1.Active := True;
  lbl2.Caption := IntToStr(dm.cds1.RecordCount); 
end;

procedure TForm1.N6Click(Sender: TObject);
var i: Integer;
begin
        for I := 0 to DBGridEh1.SelectedRows.Count - 1 do
        begin

          DM.cds1.GotoBookmark(Pointer(DBGridEh1.SelectedRows.Items[I]));
          DBGridEh1.DataSource.DataSet.Edit;
          DBGridEh1.DataSource.DataSet.FieldByName('selected').Value := True;
          
        end;

end;

procedure TForm1.dtp2Change(Sender: TObject);
begin
  if dm.cds1.IndexName<>'' then
  begin
 dm.cds1.DeleteIndex(dm.cds1.IndexName);
  end;
  if dm.cds1.Active then dm.cds1.Active := False;
  Toproducesql;
  dm.cds1.CommandText := new_sql;
  dm.cds1.Active := True;
  lbl2.Caption := IntToStr(dm.cds1.RecordCount);
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
if dm.cds1.IndexName<>'' then
begin
 dm.cds1.DeleteIndex(dm.cds1.IndexName);
end;
if dm.cds1.Active then dm.cds1.Active := False;  
  Toproducesql;
  dm.cds1.CommandText := new_sql;
  dm.cds1.Active := True;
  lbl2.Caption := IntToStr(dm.cds1.RecordCount);
end;

procedure TForm1.pm1Popup(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 1
   then
   begin
    N1.Enabled := False;
    N2.Enabled := False;
   end;
    if RadioGroup1.ItemIndex = 0
   then
   begin
    N1.Enabled := true;
    N2.Enabled := true;
   end;
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.Tag=Column.Index then
  case column.Title.SortMarker of
     smNoneEh: Column.Title.SortMarker:=smUpEh;
     smUpEh: Column.Title.SortMarker:=smDownEh;
     smDownEh:Column.Title.SortMarker:=smUpEh;
  end;
  if TClientDataSet(column.Field.DataSet).IndexName<>'' then
  begin
    TClientDataSet(column.Field.DataSet).DeleteIndex(TClientDataSet(column.Field.DataSet).IndexName);
  end;
  case column.Title.SortMarker of
     smNoneEh,
     smUpEh   :TClientDataSet(column.Field.DataSet).AddIndex(Column.FieldName,column.Field.FieldName,[ixDescending]);
     smDownEh:TClientDataSet(column.Field.DataSet).AddIndex(Column.FieldName,column.Field.FieldName,[ixPrimary]);
  end;
  TClientDataSet(column.Field.DataSet).IndexName:=Column.FieldName;


  if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
  begin
        label1.Caption:=column.Title.Caption;
        self.field_name:=column.FieldName;
        edit1.SetFocus;
        PreColumn.Title.Color := clBtnFace;
        Column.Title.Color := clred;
        PreColumn := column;
      
  end
  else
      edit1.SetFocus;

  DBGridEh1.Tag:=Column.Index;
end;

procedure TForm1.edit1Change(Sender: TObject);
begin
   //
     DBGridEh1.DataSource.DataSet.Filter:='';

    if trim(Edit1.text) <> '' then
    begin
      DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like '+ QuotedStr('%' + trim(edit1.text) + '%')+')'

  end else
      DBGridEh1.DataSource.DataSet.Filter:='';

  LBL2.Caption := inttostr(dbgrideh1.DataSource.DataSet.RecordCount);

  end;





procedure TForm1.btn3Click(Sender: TObject);
begin
 Export_dbGridEH_to_Excel(DBGridEh1,'补卡审批') ;
end;


//取消审核
procedure TForm1.N8Click(Sender: TObject);
var
ssql,err :string;
begin
//
   //当多选的时候此流程
   if  ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

 // Form1.Enabled := false;
    try
     if not dm.ADOConnection1.InTransaction then dm.ADOConnection1.BeginTrans;
      dm.cds1.First;
      dm.cds1.DisableControls    ;
     while not dm.cds1.Eof do
     begin

      if (DBGridEh1.DataSource.DataSet.FieldByName('selected').Value= true) then
      begin

         // 判断有没有处理并锁定

       ssql:=' select locked,b.chinesename from onoffdutydata a inner join  employeemsg b on a.employeeid=b.rkey  '+
          ' where convert(varchar(10),a.checkdate,120)= '''+copy(DateToStr(dm.cds1req_cardtime.value),1,10)+'''       '+
          ' and a.employeeid= '+inttostr(dm.cds1employeeid.asinteger)+'  ';
          err:=  self.OpenQry(ssql);
      if err<>'' then
      begin
      ShowMessage('错误：'+err);
      dm.cds1.EnableControls;
      exit;
      end
      else
      begin
       if not dm.tmp.IsEmpty  then
       begin
          if dm.tmp.FieldByName('locked').asinteger=1  then
          begin
          ShowMessage('员工:'''+dm.tmp.FieldByName('chinesename').asstring+'''当天的考勤数据已锁定，请先解锁！');
          dm.cds1.EnableControls;
          exit;
          end
          else if dm.tmp.FieldByName('locked').asinteger=0  then
          begin
            ssql:=DateToStr(dm.cds1req_cardtime.value);
          ssql:='update onoffdutydata set '  +
           ' OnDutyTime1=null, OffDutyTime1=null, OnDutyTime2=null, OffDutyTime2=null, OnDutyTime3=null, OffDutyTime3=null, OffDutyTime4=null, OnDutyTime4=null,'+
           ' YTNote=null, RWT=0, ROT=0, SumCN=0, '+
           ' SumCT=0, SumZN=0, SumZT=0, SumKN=0, SumKT=0, SumWN=0, SumWT=0, SumJN=0, SumJT=0, SumEN=0, SumET=0, SumLT=0,SumLN=0,NCN=0,CN1=0, CT1=0, CN2=0,CT2=0,CN3=0,CT3=0, '+
           ' CN4=0, CT4=0, ZN1=0, ZT1=0, ZN2=0, ZT2=0, ZN3=0, ZT3=0, ZN4=0, ZT4=0, KN1=0, KT1=0, KN2=0, KT2=0, KN3=0, KT3=0, KN4=0, KT4=0, WN1=0, WT1=0, WN2=0, WT2=0, WN3=0, WT3=0, WN4=0, WT4=0, JN1=0, '+
           ' JT1=0, JN2=0, JT2=0, JN3=0, JT3=0, JN4=0, JT4=0, LN1=0, LT1=0, LN2=0, LT2=0, LN3=0, LT3=0, LN4=0, LT4=0, EN1=0, ET1=0, EN2=0, ET2=0, EN3=0, ET3=0, EN4=0, YT=0, OvertimeType=0, SegNo=0, cardcheck=0, '+
           ' ET4=0, SWT=0, OWT=0  '+
           ' where convert(varchar(10),checkdate,120)= '''+copy(DateToStr(dm.cds1req_cardtime.value),1,10)+'''   '+
           ' and employeeid= '+inttostr(dm.cds1employeeid.asinteger)+'  ';
          end;
         with  dm.tmp do
         begin
          close;
          sql.Clear;
          sql.Add(ssql);
          ExecSQL;
         end;

       end;


      end;

        qry_cancel.Close;
        qry_cancel.Parameters[0].Value := dm.cds1rkey.AsInteger;
        qry_cancel.Parameters[1].Value := dm.cds1reqtype.AsInteger;
        qry_cancel.Parameters[2].Value :=  UserRkey;
        qry_cancel.Parameters[3].Value :=  UserName;
       qry_cancel.ExecSQL;

      end;





      dm.cds1.next;
      Application.ProcessMessages;
      end;

      dm.ADOConnection1.CommitTrans;
       dm.cds1.EnableControls;

      btn1.Click;
     // Form1.Enabled := True;

     except on e: Exception do
     begin
      ShowMessage('错误：'+e.Message);
      dm.ADOConnection1.RollbackTrans;
      qry_cancel.EnableControls;
       exit;
     end;

     end;
     ShowMessage('取消成功');
    qry_cancel.EnableControls;

end;

procedure TForm1.mniN10Click(Sender: TObject);
var
  LFrm: TfrmChaoka;
  LTmpTime:TDateTime;
  LTimeStr:string;
begin
  LTmpTime:= getsystem_date(dm.tmp,1);
  LTimeStr:= FormatDateTime('YYYY-MM',LTmpTime);
  LTmpTime:= StrToDate(LTimeStr + '-01');
  LFrm:= TfrmChaoka.Create(Application);
  try
    LFrm.dtpk1.Date:= LTmpTime;
    LFrm.dtpk2.Date:= IncDay(IncMonth(LTmpTime,1),-1);
    LFrm.ShowModal;
  finally
    if dm.qry1.Active then dm.qry1.Close;
    LFrm.Free;
  end;

end;

end.
