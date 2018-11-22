unit Main_Frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, dbcgrids,
  DBCtrls, Mask, common, DB, ComCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, ADODB ;

type
  TFrm_Main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    BtQry: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBCtrlGrid1: TDBCtrlGrid;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label14: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    IdFTP1: TIdFTP;
    Panel3: TPanel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit8: TEdit;
    Label9: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit9: TEdit;
    Label10: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGridEh1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
  private
    PreColumn: TColumnEh;
    rkey419:Integer;
    strStatusValue,ssql,sql_text:string;
    procedure loadField(tmp2: TADOQuery;DbGrid: TDBGridEh);
    procedure showField(rkey:Integer;dbGrid:TDBGridEh);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Main: TFrm_Main;

implementation

uses damo, ApprovalProcessFrm, NewProductFrm, ApprovalinfoFrm, QuerySet,
  PasFieldShow;

{$R *.dfm}

procedure TFrm_Main.BitBtn1Click(Sender: TObject);
begin
  close;
  application.Terminate;
end;

procedure TFrm_Main.BitBtn2Click(Sender: TObject);
var
 rkey6001:integer;
begin
  rkey6001:=dm.ADS600Rkey.Value;
  dm.ADS600.Close;
  dm.ADS600.Prepared;
  dm.ADS600.Open;
  if rkey6001 > 0 then
   dm.ADS600.Locate('rkey',rkey6001,[]);

end;

procedure TFrm_Main.BitBtn4Click(Sender: TObject);
begin
 if not dm.ADS600.IsEmpty then
 if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TFrm_Main.Button1Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  try
    Frm_ApprovalProcess := TFrm_ApprovalProcess.Create(Self);
    if Frm_ApprovalProcess.ShowModal = mrok then
  finally
    Frm_ApprovalProcess.Free;
  end
end;

procedure TFrm_Main.FormCreate(Sender: TObject);
begin
  if not App_init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;

//  rkey73:= '3476';
//  user_ptr:='4106';
//  vprev:= '4';
////
//  DateSeparator := '-';
//  ShortDateFormat := 'yyyy-MM-dd';
//  LongDateFormat := 'yyyy-mm-dd HH:mm:ss';
end;

procedure TFrm_Main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS600.CommandText);
end;

procedure TFrm_Main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4) and (strtoint(vprev)<>2) then
  begin
    messagedlg('对不起!您没有该程序的新建权限',mtinformation,[mbok],0);
    Exit;
  end;
  try
    frm_NewProduct := Tfrm_NewProduct.Create(Self);
    DM.ADS6031.Close;
    DM.ads6031.Parameters[0].Value := 0 ;
    DM.ADS6031.Open;
    frm_NewProduct.status := 1;  //新建
    if frm_NewProduct.ShowModal = mrok then
    begin
      dm.ADS600.Close;
      dm.ADS600.Prepared;
      dm.ADS600.Open;
      dm.ADS600.Locate('rkey',frm_NewProduct.rkey600,[]);
      ShowMessage('新增操作成功');
    end;
  finally
    frm_NewProduct.free;
  end;

end;

procedure TFrm_Main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4) and (strtoint(vprev)<>2) then
  begin
    messagedlg('对不起!您没有该程序的编辑权限',mtinformation,[mbok],0);
    Exit;
  end;
  try
    frm_NewProduct := Tfrm_NewProduct.Create(Self);
    DM.ADS6031.Close;
    DM.ads6031.Parameters[0].Value := DM.ADS600Rkey.Value ;
    DM.ADS6031.Open;

    frm_NewProduct.status := 2;  //编辑
    if frm_NewProduct.ShowModal = mrok then
    begin
      BitBtn2Click(Sender);
      ShowMessage('编辑操作成功');
    end;
  finally
    frm_NewProduct.free;
  end;
end;

procedure TFrm_Main.N3Click(Sender: TObject);
begin

  try
    frm_NewProduct := Tfrm_NewProduct.Create(Self);
    DM.ADS6031.Close;
    DM.ads6031.Parameters[0].Value := DM.ADS600Rkey.Value ;
    DM.ADS6031.Open;

    frm_NewProduct.status := 3;  //检查
    if frm_NewProduct.ShowModal = mrok then

  finally
    frm_NewProduct.free;
  end;
end;

procedure TFrm_Main.FormShow(Sender: TObject);
begin
  PreColumn := DBGridEh1.Columns[0];
  sql_text := DM.ADS600.CommandText;
  DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)-30;
  DateTimePicker2.Date := common.getsystem_date(dm.tmp,0);
  strStatusValue := ' and data0600.status in (1,2,3,4) ' ;
  DM.ADS600.Close;
  DM.ADS600.CommandText :=  sql_text+strStatusValue+ssql+' and (data0600.create_date >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0600.create_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+')';
  DM.ADS600.Open;

  DM.ADS603.Close;
  DM.ADS603.Open;
 

end;

procedure TFrm_Main.N6Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4) and (strtoint(vprev)<>2) then
  begin
    messagedlg('对不起!您没有该程序的提交权限',mtinformation,[mbok],0);
    Exit;
  end;
  dm.ADOConnection1.BeginTrans;
  try
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Text := 'delete data0602 where npi_ptr=' + DM.ADS600Rkey.AsString;
    DM.ADOQuery1.ExecSQL;
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Text := 'insert into DATA0602(npi_ptr,dept_ptr,rec_no,auth_flag,csi_ptr)'+
    ' select '+DM.ADS600Rkey.AsString+', rkey34,rec_no,0,csi_ptr  from DATA0615 where v_ttype= ' + quotedstr(DM.ADS600v_ttype.AsString);
    DM.ADOQuery1.ExecSQL;
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Text := 'declare @classid as int '+#13+
      'INSERT INTO data0014([MESSAGE],senddate,whosend) VALUES(''NPI新产品导入需要您审核'',GETDATE(),'+rkey73+')'+'select @classid=@@identity ' +#13+
      'INSERT INTO data0314(emp_ptr,d14_ptr) select csi_ptr ,@classid   from DATA0615 where v_ttype= ' + quotedstr(DM.ADS600v_ttype.AsString);
      
      ExecSQL;
    end;
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Text := 'update data0600 set status=2,submit_date=getdate() where rkey = '+ DM.ADS600Rkey.AsString;
      ExecSQL;
    end;
    dm.ADOConnection1.CommitTrans;
    ShowMessage('提交成功!');
    BitBtn2Click(Sender);
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     screen.Cursor:=crdefault;
     messagedlg(E.Message,mterror,[mbcancel],0);
     exit;
    end;
  end;
end;

procedure TFrm_Main.N7Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4) and (strtoint(vprev)<>2) then
  begin
    messagedlg('对不起!您没有该程序的取消提交权限',mtinformation,[mbok],0);
    Exit;
  end;
  with dm.ADOQuery1 do
  begin
    Close;
    SQL.Text := ' select * from data0602 where npi_ptr='+dm.ADS600Rkey.AsString+' and user_ptr is not null';
    Open;
    if not DM.ADOQuery1.IsEmpty then
    begin
      messagedlg('对不起!此审批流程已有人审核不能再取消提交!',mtinformation,[mbok],0);
      exit;
    end;
  end;
  dm.ADOConnection1.BeginTrans;
  try
    with dm.ADOQuery1 do
    begin
      close;
      SQL.Text := 'delete data0602 where npi_ptr=' + DM.ADS600Rkey.AsString;
      ExecSQL;
    end;
    with dm.ADOQuery1 do
    begin
      Close;
      SQL.Text := 'update data0600 set status=1 where rkey = '+ DM.ADS600Rkey.AsString;
      ExecSQL;
    end;
    dm.ADOConnection1.CommitTrans;
    ShowMessage('取消提交成功!');
    BitBtn2Click(Sender);
  except
    on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     screen.Cursor:=crdefault;
     messagedlg(E.Message,mterror,[mbcancel],0);
     exit;
    end;
  end;
end;



procedure TFrm_Main.N4Click(Sender: TObject);
var
  lftp : TIdFTP;
  LFtpDir,LFtpName:string;
  list : TStringList;
  i : Integer;
begin
  if (strtoint(vprev)<>4) and (strtoint(vprev)<>2) then
  begin
    messagedlg('对不起!您没有该程序的删除权限',mtinformation,[mbok],0);
    Exit;
  end;

  if messagedlg('您确定要删除该条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    LFtp:= TIdFTP.Create(nil);
    list := TStringList.Create;
    try

      with DM.tmp do
      begin
        Close;
        SQL.Text:= 'SELECT DATA0601.rec_no,Tier3_CustomerFiles.Ftp_fileName,Tier3_CustomerFiles.Ftp_Ptr '+
        'FROM dbo.DATA0601 INNER JOIN Tier3_CustomerFiles ON DATA0601.FtpIDKey = Tier3_CustomerFiles.IDKey'+
        '  where DATA0601.npi_ptr = ' + DM.ADS600Rkey.AsString;
        open;
      end;
      DM.tmp.First;
      while not DM.tmp.Eof do
      begin
        with DM.ADOQuery1 do
        begin
          Close;
          SQL.Text:= 'SELECT top 1 Rkey, FtpIP, FtpUserName, FtpPassWord, FtpDir + isnull(SubDir_1,'''') + isnull(SubDir_2,'''') as FDir ' + #13+
                     ' from tier3_ftplist where rkey = ' + DM.tmp.FieldByName('Ftp_ptr').AsString;
          open;
          if not IsEmpty then
          begin
            LFtpName := DM.tmp.FieldByName('Ftp_fileName').AsString;
            LFtp.Host := Fields[1].AsString;
            LFtp.Username := Fields[2].AsString;
            LFtp.Password := Fields[3].AsString;
            LFtpDir := Trim(Fields[4].AsString);
            list.Add(LFtpDir + LFtpName);
          end
          else
          begin
            ShowMessage('没有找到FTP服务器，请联系管理员');
            exit;
          end;
        end;
        DM.tmp.Next;
      end;
      if not DM.ADS601.IsEmpty then
      try
        if not LFtp.Connected then LFtp.Connect(True,10000);

        if LFTp.Connected then
        begin
          for i :=0 to (list.Count - 1) do
          begin
            try
              LFTp.Delete(list[i]);
            except
//                ShowMessage('文件已经不存在');
              Continue;
            end
          end;

        end;
      except
        ShowMessage('FTP链接失败,删除失败');
      end;

    finally
      if LFTp.Connected then LFTp.Disconnect;
      LFTp.Free;
      list.Free;
    end;
      
    dm.ADOConnection1.BeginTrans;
    try
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Text := 'delete data0601 where npi_ptr = '+dm.ADS600Rkey.AsString;
        ExecSQL;
      end;


      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Text := 'delete data0602 where npi_ptr = '+ DM.ADS600Rkey.AsString;
        ExecSQL;
      end;
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Text := 'delete data0603 where npi_ptr = ' + DM.ADS600Rkey.AsString;
        ExecSQL;
      end;
      with DM.ADOQuery1 do
      begin
        Close;
        SQL.Text := 'delete data0600 where rkey = ' + DM.ADS600Rkey.AsString;
        ExecSQL;
      end;



      dm.ADOConnection1.CommitTrans;
      BitBtn2Click(Sender);
      showmessage('数据成功删除!!!');
    except
      dm.ADOConnection1.RollbackTrans;
      showmessage('数据不成功,请速与管理员联系!!!');
    end;
  end;
end;

procedure TFrm_Main.N8Click(Sender: TObject);
begin
  try
    Frm_Approvalinfo := TFrm_Approvalinfo.Create(Self);
    DM.ADS602.Close;
    DM.ADS602.Parameters[0].Value := DM.ADS600Rkey.AsString;
    DM.ADS602.Open;
    if Frm_Approvalinfo.ShowModal = mrok then
  finally
    Frm_Approvalinfo.Free;
  end;

end;

procedure TFrm_Main.PopupMenu1Popup(Sender: TObject);
begin
  if DM.ADS600.IsEmpty then
  begin
    N1.Enabled := True;
    N2.Enabled := False;
    N3.Enabled := False;
    N4.Enabled := False;
//    N5.Enabled := False;
    N6.Enabled := False;
    N7.Enabled := False;
    n8.Enabled := False;
  end
  else
  begin
//    N1.Enabled := ((StrToInt(vprev)=2) or (StrToInt(vprev)=4));
//    N2.Enabled := ((StrToInt(vprev)=2) or (StrToInt(vprev)=4)) and
//                  ((DM.ADS600status.Value = 1) or (DM.ADS600status.Value = 4));
//    N3.Enabled := True;
//    N4.Enabled := ((StrToInt(vprev)=2) or (StrToInt(vprev)=4)) and
//                  ((DM.ADS600status.Value = 1) or (DM.ADS600status.Value = 4));
    N1.Enabled := True;
    N2.Enabled := (DM.ADS600status.Value = 1) or (DM.ADS600status.Value = 4);
    N3.Enabled := True;
    N4.Enabled := (DM.ADS600status.Value = 1) or (DM.ADS600status.Value = 4);
    N6.Enabled := DM.ADS600status.Value = 1;
    N7.Enabled := DM.ADS600status.Value = 2; 
    n8.Enabled := True;
  end;
end;

procedure TFrm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker = smDownEh then
  begin
    column.Title.SortMarker := smUpEh;
    dm.ADS600.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADS600.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
    Label1.Left := Button1.Left + Button1.Width +5;
    Edit1.Left := Label1.Left + Label1.Width + 5 ;

  end
  else
    edit1.SetFocus;
end;

procedure TFrm_Main.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    dbgrideh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TFrm_Main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if DM.ADS600status.Value = 1 then
    DBGrideh1.Canvas.Font.Color := clGreen;
  if dm.ADS600status.Value = 3 then
    DBGrideh1.Canvas.Font.Color := clBlue;
  if dm.ADS600status.value = 4 then
    DBGrideh1.Canvas.Font.Color := clRed;
  DBGrideh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_Main.CheckBox1Click(Sender: TObject);
begin
  strStatusValue:='';
  if CheckBox1.Checked then
    strStatusValue:='1,';
  if CheckBox2.Checked then
    strStatusValue:=strStatusValue+'2,';
  if CheckBox3.Checked then
    strStatusValue:=strStatusValue+'3,';
  if CheckBox4.Checked then
    strStatusValue:=strStatusValue+'4,';
  if  strStatusValue<>'' then
  begin                            //    去掉后面的一个","
    strStatusValue:=' and Data0600.status in ('+copy(strStatusValue,0,Length(strStatusValue)-1)+')'+#13;
  end
  else
    strStatusValue := ' and Data0600.status in(9)'+#13;

  with DM.ADS600 do
  begin
    Close;
    DM.ADS600.CommandText :=  sql_text+strStatusValue+ssql+' and (data0600.create_date >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0600.create_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+')';
    Open;
  end;

end;

procedure TFrm_Main.DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS603.CommandText);
end;

procedure TFrm_Main.loadField(tmp2: TADOQuery; DbGrid: TDBGridEh);
var
  i:Integer;
begin
  with tmp2 do
  begin
    for i:=0 to DbGrid.Columns.Count-1 do
    begin
      if (FieldByName('FieldName').Value=DbGrid.Columns[i].FieldName) then
      begin
        if (FieldByName('IsDisplay').Value <> DbGrid.Columns[i].Visible) or (FieldByName('FieldWidth').Value <> DbGrid.Columns[i].Width) then
        begin
          DbGrid.Columns[i].Visible:= FieldByName('IsDisplay').Value;
          DbGrid.Columns[i].Width:= FieldByName('FieldWidth').Value;
        end;
        DbGrid.Columns[i].Index:= FieldByName('FieldOrder').Value ;
        Break;
      end;
    end;
  end;

end;

procedure TFrm_Main.showField(rkey: Integer; dbGrid: TDBGridEh);
var
  i,addInt:Integer;
  tmpstr:string;
  bool : Integer;
  addField:Boolean;
begin
  try
//    aqtmp:=TADOQuery.Create(nil);
//    aqtmp.Connection:=DM.ADOConnection1;
    DM.ADOQuery1.Close;
    tmpstr:='select Rkey, D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay '+
              ' from data0849 where D419_ptr= '+ IntToStr(rkey) +' and D073_ptr= ' + rkey73;
//              +' and FormName= '+ QuotedStr(Self.Name) + ' and GridName= '+ QuotedStr(dbGrid.Name);
    DM.ADOQuery1.SQL.Text := tmpstr;
    DM.ADOQuery1.Open;
      with DM.ADOQuery1 do
      begin
        if not IsEmpty then
        begin
          if RecordCount >= dbGrid.Columns.Count then    //没有增加字段，按数据库的数据调整排序，可见以及宽度
          begin
            Sort:='FieldOrder';
            First;
            while not Eof do
            begin
              loadField(DM.ADOQuery1,DbGrid);          //加载字段
              Next;
            end;
          end
          else
          begin                                                  //增加了字段，把新加的字段加入数据库中
            addInt:= dbGrid.Columns.Count-RecordCount;     //存增加了多少个字段
            addField:=True;
            for i:=0 to dbGrid.Columns.Count-1 do
            begin
              First;
              while not Eof do
              begin
                if DBGrid.Columns[i].FieldName=FieldByName('FieldName').Value then
                begin
                  addField:=False;
                  Break;
                end;
                addField:=True;
                Next;
              end;
              if addField then
              begin
                if DBGrid.Columns[i].Visible then bool:=1
                else bool:=0;
                with DM.tmp do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Text:= SQL.Text+ 'insert into data0849(D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay,FormName,GridName)' +
                                        'values('+IntToStr(rkey419)+','+ rkey73+','+ QuotedStr(DBGridEh1.Columns[i].FieldName)+','+
                                        QuotedStr(DBGridEh1.Columns[i].Title.Caption)+','+ IntToStr(DBGridEh1.Columns.Count - addInt)+','+
                                        IntToStr(DBGridEh1.Columns[i].Width)+','+ IntToStr(bool)+ ',''frmMain'',''dbMain'')'+#13;
                  ExecSQL;
                end;
                addInt:=addInt - 1;
                if addInt = 0 then Break;
              end;
            end;
            First;
            while not Eof do
            begin
              loadField(DM.ADOQuery1,DbGrid);          //加载字段
              Next;
            end;
          end;
        end
        else
        begin
          tmpstr:='';                         //如果当前使用人员当前程序在849表没找到，则新增
          for i:=0 to dbGrid.Columns.Count-1 do
          begin
            tmpstr:=tmpstr+ 'insert into data0849(D419_ptr, D073_ptr, FieldName, FieldCaption, FieldOrder, FieldWidth, IsDisplay,FormName,GridName)' +
                                  'values('+IntToStr(rkey)+','+ rkey73+','+ QuotedStr(dbGrid.Columns[i].FieldName)+','+
                                  QuotedStr(dbGrid.Columns[i].Title.Caption)+','+ IntToStr(dbGrid.Columns[i].Index)+','+
                                  IntToStr(dbGrid.Columns[i].Width)+','+ QuotedStr(BoolToStr(dbGrid.Columns[i].Visible,True)) + ','+
                                  QuotedStr(Self.Name) +','+ QuotedStr(dbGrid.Name)+')'+#13;
          end;
          dm.tmp.Close;
          dm.tmp.SQL.Text:=tmpstr;
//          ShowMessage(dm.tmp.SQL.Text);
          dm.tmp.ExecSQL;
//          mc.ExecSql(tmpstr);
        end;
      end;

  finally
//    aqtmp.Free;
  end;

end;

procedure TFrm_Main.FormActivate(Sender: TObject);
begin
  with DM.Tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select Rkey from data0419 where programe=''wzpr600.exe''';
    Open;
    if not IsEmpty then
     rkey419:= FieldByName('rkey').Value;
  end;

  Self.showField(rkey419,DBGridEh1);
end;

procedure TFrm_Main.DateTimePicker1CloseUp(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TFrm_Main.DateTimePicker1Exit(Sender: TObject);
begin
  DM.ADS600.Close;
  dm.ADS600.CommandText := sql_text+strStatusValue+ssql+' and (data0600.create_date >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0600.create_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+')';
  DM.ADS600.Open;
end;

procedure TFrm_Main.BtQryClick(Sender: TObject);
var
  i:integer;
begin
  if frmQuerySet.ShowModal=mrok then
  begin
    dm.ADS600.Close;
    dm.ADS600.CommandText := sql_text;
    ssql:='';
    for i:=1 to frmQuerySet.SGrid1.RowCount-2 do
      ssql := ssql+ frmQuerySet.SGrid1.Cells[2,i]+#13;
    DM.ADS600.CommandText :=  sql_text+strStatusValue+ssql+' and (data0600.create_date >= '+quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+
    ') and (data0600.create_date <='+ quotedstr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date+1))+')';
    dm.ADS600.Open;
  end;

end;

procedure TFrm_Main.BitBtn6Click(Sender: TObject);
begin
  try
    frmFieldShow:=TfrmFieldShow.Create(Application);
    frmFieldShow.key419:=rkey419;
    if frmFieldShow.ShowModal=mryes then
    begin
      Self.showField(rkey419,DBGrideh1);
    end;
  finally
    frmFieldShow.Free;
  end;
end;

procedure TFrm_Main.DBGridEh1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i,tmp:Integer;
begin
  if MessageDlg('列顺序已经改变，是否保存排序？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    if FromIndex>ToIndex then
    begin
      tmp:=FromIndex;
      FromIndex:=ToIndex;
      ToIndex:=tmp;
    end;
    for i:= FromIndex to ToIndex do
    begin
      with DM.tmp do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='update data0849 set fieldorder='+ IntToStr(i)+' where D419_ptr='+
                IntToStr(rkey419) +' and D073_ptr='+rkey73 +
                ' and fieldname=' + QuotedStr(DBGridEh1.Columns[i].FieldName);
        ExecSQL;
      end;
    end;
  end;

end;

end.
