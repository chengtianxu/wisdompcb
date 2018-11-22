unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGrids, StdCtrls, ExtCtrls, Buttons, Grids, DBGridEh, ComCtrls,
  Menus, DB, ADODB, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppCtrls, ppPrnabl, ppBands, ppCache, ppEndUsr;

type
  TForm1 = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    Splitter1: TSplitter;
    Panel2: TPanel;
    CheckBox0: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    DBGrid1: TDBGrid;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    BitBtn6: TBitBtn;
    N6: TMenuItem;
    CheckBox4: TCheckBox;
    ChkBoxFilteDate: TCheckBox;
    RadioGroup1: TRadioGroup;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox0Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure ChkBoxFilteDateClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;

    grid_colwith:integer;
    curr_ranking:integer;
    emp_ptr:integer;
    v_colwidth1,v_colwidth2: array of integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common,AuthInfo_U;

{$R *.dfm}

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.ADS268.IndexFieldNames:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS268.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i:integer;
  curr_date:tdatetime;
begin
  if  dm.ADOConnection1.Connected then
  begin
    dm.ADOQuery1.Close;
    dm.ADOQuery1.SQL.Text:='SELECT EMPLOYEE_PTR '+#13+
                           'FROM dbo.Data0073 '+#13+
                           'WHERE RKEY = '+RKEY73;
    dm.ADOQuery1.Open;

    emp_ptr:=dm.ADOQuery1.FieldValues['employee_ptr'];

    curr_date := getsystem_date(dm.adoquery1,1);
    dtpk1.Date := curr_date-7;
    dtpk2.Date := curr_date;
    dm.ADS268.Close;
    dm.ADS268.Parameters.ParamByName('dtpk1').Value := curr_date-7;
    dm.ADS268.Parameters.ParamByName('dtpk2').Value := curr_date+1;
    dm.ADS268.Parameters.ParamByName('Rkey73').Value:= strtoint(rkey73); 
    dm.ADS268.Open;
    dm.ADS468.Open;

    PreColumn := DBGridEH1.Columns[0];

    grid_colwith := dbgrid1.Width;
    setlength(v_colwidth1,DBGridEh1.FieldCount);
    setlength(v_colwidth2,dbgrid1.FieldCount);

    for i := 0 to high(v_colwidth1) do v_colwidth1[i] := DBGridEh1.Columns[i].Width;
    for i := 0 to high(v_colwidth2) do v_colwidth2[i] := dbgrid1.Columns[i].Width;
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
  for i:=low(v_colwidth1) to high(v_colwidth1) do
    DBGridEh1.Columns[i].Width:=v_colwidth1[i]+
      round((DBGridEh1.Width-grid_colwith)*v_colwidth1[i]/(grid_colwith-28));

  for i:=low(v_colwidth2) to high(v_colwidth2) do
    dbgrid1.Columns[i].Width:=v_colwidth2[i]+
      round((dbgrid1.Width-grid_colwith)*v_colwidth2[i]/(grid_colwith-28));
      
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
  application.Terminate;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS268.CommandText);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  v_rkey: integer;
begin
  v_rkey := 0;
  if not dm.ADS268.IsEmpty then  v_rkey := dm.ADS268rkey.Value;
  dm.ADS268.Close;
  dm.ADS268.Open;
  if v_rkey > 0 then  dm.ADS268.Locate('rkey',v_rkey,[]);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dm.ADS268.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dm.ADS268.filter := '';
end;

procedure TForm1.CheckBox0Click(Sender: TObject);
begin
  dm.ADS268.Close;
  if CheckBox0.Checked then
    dm.ADS268.Parameters.ParamByName('v0').Value:=9
  else
    dm.ADS268.Parameters.ParamByName('v0').Value:=0;

  if checkbox1.Checked then
    dm.ADS268.Parameters.ParamByName('v1').Value:=9
  else
    dm.ADS268.Parameters.ParamByName('v1').Value:=1;

  if checkbox2.Checked then
    dm.ADS268.Parameters.ParamByName('v2').Value:=9
  else
    dm.ADS268.Parameters.ParamByName('v2').Value:=2;

  if checkbox3.Checked then
    dm.ADS268.Parameters.ParamByName('v3').Value:=9
  else
    dm.ADS268.Parameters.ParamByName('v3').Value:=3;

  if checkbox4.Checked then
    dm.ADS268.Parameters.ParamByName('v4').Value:=9
  else
    dm.ADS268.Parameters.ParamByName('v4').Value:=4;

  dm.ADS268.Open;

end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
  dm.ADS268.Close;
  dm.ADS268.Parameters[0].Value := dtpk1.Date;
  dm.ADS268.Parameters[1].Value := dtpk2.Date+1;
  dm.ADS268.Open;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
var
  draw_materiel_ptr: Integer;
  I: Integer;
begin
  with dm.qrytmp do
  begin
    close;
    sql.Text:='SELECT draw_materiel_ptr FROM Data0073 where RKEY ='+rkey73;
    open;
    draw_materiel_ptr := FieldValues['draw_materiel_ptr'];
  end;

  if draw_materiel_ptr<>strtoint(rkey73) then
  begin
    with dm.qrytmp do
    begin
      close;
      sql.text:='SELECT user_full_name FROM Data0073 where RKEY ='+inttostr(draw_materiel_ptr);
      open;
      messagedlg('您已经将领料审批授权给用户：'+fieldvalues['user_full_name']+' 请首先取消授权',mtinformation,[mbok],0);
    end;
    for I := 0 to PopupMenu1.Items.Count - 1 do
      PopupMenu1.Items[I].Enabled := False;
    Exit;
  end;

  if dm.ADS268.IsEmpty then
  begin
    n1.Enabled:=false;
    n2.Enabled:=false;
    n4.Enabled:=false;
    n6.Enabled:=false;
    exit;
  end;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Text:='select status from data0268 where rkey='+dm.ADS268rkey.AsString+
              ' and status='+dm.ADS268status.AsString;
    open;
  end;
  if dm.ADOQuery1.IsEmpty then
  begin
    BitBtn3Click(nil);
  end;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Text:='SELECT TOP 1 RKEY '+#13+
              'FROM   dbo.DATA0368'+#13+
              'WHERE  (auth_flag = ''Y'') AND (apply_ptr = '+dm.ADS268rkey.AsString+') AND (RANKING <> 1)';
    open;
  end;

  n1.Enabled:=dm.ADS268status.Value=1;
  n4.Enabled:=n1.Enabled;
  n2.Enabled:=dm.ADS268status.Value=2;
  if (dm.ADS268status.Value=1) AND (NOT DM.ADOQuery1.IsEmpty) then
    n2.Enabled:=true;
  //n5.Enabled:=n2.Enabled;
  n6.Enabled :=not dm.ADS268.IsEmpty
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  if (vprev='1') or (vprev='3') then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;


    with dm.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Text:='select status from data0268 where rkey='+dm.ADS268rkey.AsString+
                ' and status='+dm.ADS268status.AsString;
      open;
    end;

    if dm.ADOQuery1.IsEmpty then
    begin
      ShowMsg('领料单状态发生变化,操作失败!',1);
      BitBtn3Click(nil);
      exit;
    end;

    with dm.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Text:='SELECT dbo.DATA0368.rkey, dbo.DATA0368.apply_ptr, dbo.DATA0368.user_ptr, dbo.DATA0368.auth_date, dbo.DATA0368.ranking, dbo.DATA0368.auth_flag, '+#13+
                  '       dbo.DATA0368.remark, dbo.Data0073.draw_materiel_ptr, Data0073_1.USER_FULL_NAME AS RPL_USER_FULL_NAME '+#13+
                  'FROM   dbo.DATA0368 INNER JOIN '+#13+
                  '       dbo.Data0073 ON dbo.DATA0368.user_ptr = dbo.Data0073.RKEY INNER JOIN '+#13+
                  '       dbo.Data0073 AS Data0073_1 ON dbo.Data0073.draw_materiel_ptr = Data0073_1.RKEY '+#13+
                  'WHERE  (dbo.DATA0368.auth_flag = ''Y'') AND (dbo.DATA0368.apply_ptr = '+DM.ADS268rkey.AsString+')';
        open;
      end;
   if dm.ADOQuery1.FieldByName('draw_materiel_ptr').AsString='' then
   begin
        showmessage('当前没有审核人员，请与审核部门联系。');
        exit;
   end else begin

    if dm.ADOQuery1.FieldByName('draw_materiel_ptr').AsString<>rkey73 then
      begin
        showmessage('您不是当前审批人，当前审批人是：'+dm.ADOQuery1.FieldValues['RPL_USER_FULL_NAME']);
        exit;
      end;
   end;

    curr_ranking:=dm.ADOQuery1.Fieldbyname('ranking').AsInteger;



    try
    dm.ADOConnection1.BeginTrans;
    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='UPDATE DATA0368 '+#13+
                'SET    auth_date = GETDATE(), auth_flag = ''N'''+#13+
                'WHERE  (auth_flag = ''Y'') AND (apply_ptr = '+dm.ADS268rkey.AsString+')';
      ExecSQL;
    end;

    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='UPDATE DATA0368 '+#13+
                'SET    auth_flag=''Y'''+#13+
                'WHERE  (ranking = '+inttostr(curr_ranking+1)+') AND (apply_ptr = '+dm.ADS268rkey.AsString+')';
      ExecSQL;
    end;




    if dm.ADOQuery1.RowsAffected=0 then
      with dm.adoquery1 do
      begin

//      if dm.ADS268EMPL_PTR.asinteger=emp_ptr then
//        begin
//        ShowMessage('审核人和申请人不能一样！');
//        exit;
//        end;

        close;
        sql.Text:='UPDATE DATA0268 '+#13+
                  'SET    auth_emplptr = '+inttostr(emp_ptr)+', auth_date = DATA0368.auth_date, status=2 '+#13+
                  'FROM   DATA0268 INNER JOIN '+#13+
                  '       DATA0368 '+#13+
                  '         ON DATA0268.rkey = DATA0368.apply_ptr '+#13+
                  'WHERE DATA0268.rkey ='+dm.ADS268rkey.AsString;

        {sql.Text:='UPDATE DATA0268 '+#13+
                  'SET    auth_emplptr = '+inttostr(emp_ptr)+', auth_date = DATA0368_1.auth_date, status=2 '+#13+
                  'FROM   DATA0268 INNER JOIN '+#13+
                  '       (SELECT TOP 1 apply_ptr, auth_date '+#13+
                  '        FROM   DATA0368 '+#13+
                  '        ORDER BY auth_date DESC) AS DATA0368_1 ON DATA0268.rkey = DATA0368_1.apply_ptr '+#13+
                  'WHERE DATA0268.rkey ='+dm.ADS268rkey.AsString; }
        ExecSQL;
      end;

    dm.ADOConnection1.CommitTrans;
    ShowMsg('审核操作成功!',1);
    BitBtn3Click(nil);
  except
    on E: Exception do
    begin
      dm.ADOConnection1.RollbackTrans;
      messagedlg('审核操作失败'+#13+'原因：'+E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
  str:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Text:='select status from data0268 where rkey='+dm.ADS268rkey.AsString+
               ' and status='+dm.ADS268status.AsString;
    open;
  end;
  if dm.ADOQuery1.IsEmpty then
  begin
    ShowMsg('领料单状态发生变化,操作失败!',1);
    BitBtn3Click(nil);
    exit;
  end;

  with dm.adoquery1 do
  begin
    close;
    sql.Text:='SELECT TOP 1 QUAN_ISSUED '+#13+
              'FROM    Data0468 '+#13+
              'WHERE   (QUAN_ISSUED > 0) AND (FLOW_NO = '+dm.ADS268rkey.AsString+')';
    open;
  end;
  if not dm.ADOQuery1.IsEmpty then
  begin
    showmessage('领料单已发料，不允许反审领料单！');
    BitBtn3Click(nil);
    exit;
  end;

  if dm.ADS268status.Value=2 then
  begin
    with dm.adoquery1 do
    begin
      close;
      sql.Text:='SELECT TOP 1 DATA0368.user_ptr, DATA0368.ranking, Data0073_1.USER_FULL_NAME, Data0073.draw_materiel_ptr '+#13+
                'FROM         DATA0368 INNER JOIN '+#13+
                '             Data0073 ON DATA0368.user_ptr = Data0073.RKEY INNER JOIN '+#13+
                '             Data0073 AS Data0073_1 ON Data0073.draw_materiel_ptr = Data0073_1.RKEY '+#13+
                'WHERE  DATA0368.apply_ptr = '+dm.ADS268rkey.AsString+' '+#13+
                'ORDER BY DATA0368.ranking DESC';
      open;
    end;

    curr_ranking:=dm.ADOQuery1.FieldByName('ranking').AsInteger+1;

    if dm.ADOQuery1.FieldByName('draw_materiel_ptr').AsString<>rkey73 then
    begin
      showmessage('反审失败！您不是最后审批人，最后审批人是：'+dm.ADOQuery1.FieldValues['USER_FULL_NAME']);
      BitBtn3Click(nil);
      exit;
    end;
  end;

  if dm.ADS268status.Value=1 then
  begin
    with dm.adoquery1 do
    begin
      close;
      sql.Text:='SELECT ranking '+#13+
                'FROM   DATA0368 '+#13+
                'WHERE  (auth_flag = ''Y'') AND (apply_ptr = '+DM.ADS268rkey.AsString+')';
      open;
    end;
    if dm.ADOQuery1.FieldByName('ranking').AsInteger=1 then
    begin
      showmessage('该领料单没有审批，不需要反审！');
      BitBtn3Click(nil);
      exit;
    end;

    curr_ranking:=dm.ADOQuery1.FieldByName('ranking').AsInteger;

    with dm.adoquery1 do
    begin
      close;
      sql.Text:='SELECT  DATA0368.user_ptr, DATA0368.ranking, Data0073_1.USER_FULL_NAME, DATA0073.draw_materiel_ptr '+#13+
                'FROM         DATA0368 INNER JOIN '+#13+
                '             Data0073 ON DATA0368.user_ptr = Data0073.RKEY INNER JOIN '+#13+
                '             Data0073 AS Data0073_1 ON Data0073.draw_materiel_ptr = Data0073_1.RKEY '+#13+
                'WHERE  (DATA0368.apply_ptr = '+dm.ADS268rkey.AsString+') and DATA0368.ranking= '+inttostr(curr_ranking-1);
      open;
    end;
    if dm.ADOQuery1.FieldByName('draw_materiel_ptr').AsString<>rkey73 then
    begin
      showmessage('反审失败！您不是最后审批人，最后审批人是：'+dm.ADOQuery1.FieldValues['USER_FULL_NAME']);
      BitBtn3Click(nil);
      exit;
    end;
  end;

  if inputquery('反审原因','请输入反审原因:',str) then
    begin
      if trim(str) = '' then
      begin
        ShowMsg('反审原因为空操作不成功',1);
        exit;
      end;
    end
  else
    exit;

  try
    dm.ADOConnection1.BeginTrans;

    if dm.ADS268status.Value=2 then   //将状态为已审批的领料单改为未审批，并清除审批信息
      with dm.adoquery1 do
      begin
        close;
        sql.Text:='UPDATE DATA0268 '+#13+
                  'SET    status=1, auth_emplptr=null, auth_date=null '+#13+
                  'WHERE  rkey = '+dm.ADS268rkey.AsString;
        ExecSQL;
      end;

    if dm.ADS268status.Value=1 then   //修改当前审批人标志
      with dm.adoquery1 do
      begin
        close;
        sql.Text:='UPDATE DATA0368 '+#13+
                  'SET    auth_flag = ''N'''+#13+
                  'WHERE  (apply_ptr = '+dm.ADS268rkey.AsString+') AND (ranking = '+inttostr(curr_ranking)+')';
        ExecSQL;
      end;

    with dm.adoquery1 do
    begin
      close;
      sql.Text:='UPDATE DATA0368 '+#13+
                'SET    auth_flag = ''Y'', auth_date=null, remark='''+str+''' '+#13+
                'WHERE  (apply_ptr = '+dm.ADS268rkey.AsString+') AND (ranking = '+inttostr(curr_ranking-1)+')';
      ExecSQL;
    end;

    dm.ADOConnection1.CommitTrans;
    showmsg('取消审核操作成功',1);
    BitBtn3Click(nil);
  except
    on E: Exception do
    begin
      dm.ADOConnection1.RollbackTrans;
      messagedlg('审核操作失败'+#13+'原因：'+E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var draw_materiel_ptr:integer;
begin
  if dm.ADOConnection1.Connected then
    begin
      showmessage('程序处于开发模式下运行，请在发布程序前关闭连接后进行编译！');
      rkey73:='1502';
      vprev:='4';
    end
  else
    if not app_init_2(dm.ADOConnection1) then
    begin
      showmsg('程序起动失败请联系管理员!',1);
      application.Terminate;
    end; 

  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';


  with dm.qrytmp do
  begin
    close;
    sql.Text:='SELECT draw_materiel_ptr FROM Data0073 where RKEY ='+rkey73;
    open;
    draw_materiel_ptr := FieldValues['draw_materiel_ptr'];
  end;

  if draw_materiel_ptr<>strtoint(rkey73) then
  begin
    with dm.qrytmp do
    begin
      close;
      sql.text:='SELECT user_full_name FROM Data0073 where RKEY ='+inttostr(draw_materiel_ptr);
      open;
      messagedlg('您已经将领料审批授权给用户：'+fieldvalues['user_full_name']+' 请首先取消授权',mtinformation,[mbok],0);
    end;
    application.Terminate;
    exit;
  end;

end;

procedure TForm1.N4Click(Sender: TObject);
var
  str:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Text:='select status from data0268 where rkey='+dm.ADS268rkey.AsString+
               ' and status='+dm.ADS268status.AsString;
    open;
  end;
  if dm.ADOQuery1.IsEmpty then
  begin
    ShowMsg('出仓单号状态发生变化,操作失败!',1);
    exit;
  end;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Text:='SELECT TOP 1 dbo.DATA0368.apply_ptr, dbo.Data0073.draw_materiel_ptr, dbo.DATA0368.auth_flag '+#13+
              'FROM         dbo.DATA0368 INNER JOIN '+#13+
              '             dbo.Data0073 ON dbo.DATA0368.user_ptr = dbo.Data0073.RKEY '+#13+
              'WHERE       (dbo.DATA0368.auth_flag = ''Y'') AND (dbo.DATA0368.apply_ptr = '+dm.ADS268rkey.AsString+') AND (dbo.Data0073.draw_materiel_ptr = '+rkey73+')';
    open;
  end;
  if dm.ADOQuery1.IsEmpty then
  begin
    ShowMsg('你不是当前审批人，不允许退回!',1);
    exit;
  end;

  if inputquery('退回原因','请输入退回原因:',str) then
    begin
      if trim(str) = '' then
      begin
        ShowMsg('退回原因为空操作不成功',1);
        exit;
      end
    end
  else
    exit;

  dm.ADS268.Edit;
  dm.ADS268auth_emplptr.Value :=emp_ptr ;
  dm.ADS268auth_date.Value := getsystem_date(dm.ADOQuery1,0);
  dm.ADS268status.Value := 3;
  dm.ADS268reference.Value := str;
  dm.ADS268.Post;
  BitBtn3Click(nil);
end;

procedure TForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (dm.ADS268status.Value = 0) then
    DBGridEh1.Canvas.Font.Color := cllime
  else
    if (dm.ADS268status.Value = 3) then
      DBGridEh1.Canvas.Font.Color := clRed;

  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  {try
    ppReport1.Reset;
    ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
        'zdl_getout.rtm';
    ppReport1.Template.LoadFromFile;
    ppreport1.SaveAsTemplate:=false;
    ppReport1.Print;
  finally
    free;
  end; }
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  {if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;
  try
    ppReport1.Reset;
    ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
        'zdl_getout.rtm';
    ppReport1.Template.LoadFromFile;
    ppreport1.SaveAsTemplate:=false;
    ppDesigner1.ShowModal;
  FINALLY
    Free;
  END;   }
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  AuthInfo.ADOQuery1.Close;
  AuthInfo.ADOQuery1.Open;
  AuthInfo.ShowModal;
end;

procedure TForm1.ChkBoxFilteDateClick(Sender: TObject);
begin
  dm.ADS268.Close;
  if ChkBoxFilteDate.Checked then
    dm.ADS268.Parameters.ParamByName('fd').Value:=1
  else
    dm.ADS268.Parameters.ParamByName('fd').Value:=0;
  dm.ADS268.Open;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  dm.ADS268.Close;
  case RadioGroup1.ItemIndex of
    0:
    begin
      dm.ADS268.Parameters.ParamByName('DispRang').Value:='Y';
      dm.ADS268.Parameters.ParamByName('DispRang2').Value:='Y';
    end;
    1:
    begin
      dm.ADS268.Parameters.ParamByName('DispRang').Value:='Y';
      dm.ADS268.Parameters.ParamByName('DispRang2').Value:='N';
    end;
  end;
  dm.ADS268.Open;
end;

end.
