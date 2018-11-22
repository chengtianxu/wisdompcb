unit MainUNIT1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus, DB, ADODB,DateUtils,
  DBGridEh, ComCtrls
  ;

type
  TMainForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    PopupMenu2: TPopupMenu;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    sgrid1: TStringGrid;
    DBGridEh1: TDBGridEh;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    BitBtn6: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name,sql_text:string;
    user_ptrCaption,vprevCaption,db_ptrCaption :string;

    OldGridWnd : TWndMethod;
    ADOQALL2sql :string;
    Vdtpk3Date : tdate;
    Vdtpk4Date :tdate;
    Vdtpk3Time : tTime;
    Vdtpk4Time :tTime;

    vord_req_qtycaption,vwip_qtycaption,vfg_qtycaption:string;
    vmarkCaption:integer;//投产类型　0:按订单投产 ;1:按产品投产　2：按MRB投产
    vrkeydata0025:integer;
    vSALES_ORDERdata0060:string;
    vqty_to_be_reworkeddata0414,vqty_reworkeddata0414:integer;



    procedure item_click(sender:TObject);




  public
    { Public declarations }
  end;

var
  MainForm1: TMainForm1;

implementation

USES
   common ,
   DmUnit1
   ,IF_Unit1
   //,Pick_Item_Single
   ,ConstVar
   ,EditUnit1
   ,PrintUnit1
   ;

{$R *.dfm}

procedure TMainForm1.BitBtn1Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TMainForm1.BitBtn2Click(Sender: TObject);
begin
  IF DBGridEh1.DataSource.DataSet.Active THEN
      IF DBGridEh1.DataSource.DataSet.RecordCount > 0 THEN
          Export_dbGridEH_to_Excel(DBGridEh1,'客户投诉处理') ;
end;

procedure TMainForm1.BitBtn5Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMainForm1.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin
  i := -1 ;
  IF DBGridEh1.DataSource.DataSet.Active THEN
      begin
          if not DBGridEh1.DataSource.DataSet.IsEmpty then
              i := DBGridEh1.DataSource.DataSet.FieldValues['RKEY'] ;
          DBGridEh1.DataSource.DataSet.Close ;
      end;
  DBGridEh1.DataSource.DataSet.Open ;
  if i <> -1 then DBGridEh1.DataSource.DataSet.Locate('RKEY',i,[]);
end;

procedure TMainForm1.FormCreate(Sender: TObject);

begin

  if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;

  user_ptrCaption := user_ptr;
  vprevCaption := vprev;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';


  Vdtpk3Date := EncodeDate(YearOf(now()),MonthOf(now()),1);
  Vdtpk4Date := now();
  ADOQALL2sql := '' ;
  //showmessage(ADOQALL2sql);

end;

procedure TMainForm1.FormShow(Sender: TObject);
var
  i:byte;
  item:TMenuItem;
  VT2:TTIME;
  //f1:TFieldType;
begin
 if not dm.ADOConnection1.Connected then
         application.Terminate;

  field_name := DBGridEh1.Columns[0].FieldName;
  Label1.Caption := DBGridEh1.Columns[0].Title.Caption ;
  PreColumn := DBGridEh1.Columns[0];

  for i := 1 to DBGridEh1.Columns.Count do
      begin
          item := TmenuItem.Create(self);
          item.Caption := DBGridEh1.Columns[i - 1].Title.Caption;
          if DBGridEh1.Columns[i - 1].Visible then
              item.Checked := true;
          item.OnClick := item_click;
          self.PopupMenu2.Items.Add(item);
      end;

  if ADOQALL2sql = '' then
      ADOQALL2sql := dm.ADOQALL2.SQL.Text ;
  //showmessage(ADOQALL2sql);

  //BitBtn4Click(sender);                         //FormatDateTime('yyyy-MM-dd',Date)+' '+FormatDateTime('HH:MM:SS',Time);
  Vdtpk3Time := StrToTime('00:00:00');
  dm.ADOQALL2.Parameters.ParamValues['vdate1'] := FormatDateTime('yyyy-MM-dd',Vdtpk3Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk3Time);
  Vdtpk4Time := StrToTime('23:59:59');
  dm.ADOQALL2.Parameters.ParamValues['vdate2'] := FormatDateTime('yyyy-MM-dd',Vdtpk4Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk4Time);
  //dm.ADOQALL2.Parameters.ParamValues['vptr'] := 1 ;


  dm.ADOQALL2.Prepared ;
  dm.ADOQALL2.Open ;



end;

procedure TMainForm1.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := true;
                      break ;
                  end;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false;
                      break ;
                  end ;
      end;
end;

procedure TMainForm1.Edit1Change(Sender: TObject);
begin
  //showmessage(DM.ADOQALL2     );

  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind <> fkCalculated then
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger,ftmemo]  then   //, ftWord,
          begin
              DBGridEh1.DataSource.DataSet.Filter := '';


              if trim(Edit1.text) <> '' then
                  begin
                      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString,ftmemo]  then
                          begin
                              if DBGridEh1.DataSource.DataSet.Filter <> '' then
                                  DBGridEh1.DataSource.DataSet.Filter := DBGridEh1.DataSource.DataSet.Filter + ' and ' +  field_name + ' like ''%' + trim(edit1.text) + '%'''
                              else
                                  DBGridEh1.DataSource.DataSet.Filter := field_name+' like ''%' + trim(edit1.text) + '%''' ;
                          end
                      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
                          begin
                              if DBGridEh1.DataSource.DataSet.Filter <> '' then
                                  DBGridEh1.DataSource.DataSet.Filter := DBGridEh1.DataSource.DataSet.Filter + ' and ' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))
                              else
                                  DBGridEh1.DataSource.DataSet.Filter := field_name + ' >= ' + inttostr(strtointdef(edit1.text,0)) ;
                          end;
                  end ;
          end;   
end;

procedure TMainForm1.BitBtn4Click(Sender: TObject);
var
  i,j :integer;
begin
  If_Form1:= TIf_Form1.Create(application) ;
  try
      If_Form1.DateTimePicker1.Date := Vdtpk3Date ;
      If_Form1.DateTimePicker2.Date := Vdtpk4Date ;

      If_Form1.DateTimePicker3.Time := Vdtpk3Time ;
      If_Form1.DateTimePicker4.Time := Vdtpk4Time ;


      {
      If_Form1.sgrid1.RowCount := sgrid1.RowCount;
      for j := 0 to sgrid1.ColCount - 1 do
           for i := 1 to sgrid1.RowCount - 2 do
               If_Form1.sgrid1.Cells[j,i] := sgrid1.Cells[j,i];
      {}

      if If_Form1.ShowModal = mrok then
          begin
              Vdtpk3Date :=  If_Form1.DateTimePicker1.Date;
              Vdtpk4Date := If_Form1.DateTimePicker2.Date  ;
              Vdtpk3Time := If_Form1.DateTimePicker3.Time ;
              Vdtpk4Time := If_Form1.DateTimePicker4.Time;

              sgrid1.RowCount := If_Form1.sgrid1.RowCount ;
              sgrid1.ColCount := If_Form1.sgrid1.ColCount ;
              for j := 0 to sgrid1.ColCount - 1 do
                  for i := 1 to sgrid1.RowCount - 1 do
                      sgrid1.Cells[j,i] := '';

              for j := 0 to sgrid1.ColCount - 1 do
                  for i := 1 to sgrid1.RowCount - 2 do
                      sgrid1.Cells[j,i] := If_Form1.sgrid1.Cells[j,i];

              if dm.ADOQALL2.Active then dm.ADOQALL2.Close ;
              dm.ADOQALL2.SQL.Clear ;
              dm.ADOQALL2.SQL.Add(ADOQALL2SQL);
              for i := 1 to If_Form1.sgrid1.RowCount - 2  do
                  begin
                      //showmessage(trim(If_Form1.sgrid1.Cells[2,i]));
                      dm.ADOQALL2.SQL.Add(trim(If_Form1.sgrid1.Cells[2,i]));
                  end;

              //showmessage(dm.ADOQALL2.SQL.Text);  //测试用

              //dm.ADOQALL2.Parameters.ParamValues['vdate1'] := If_Form1.DateTimePicker1.Date ;
              //dm.ADOQALL2.Parameters.ParamValues['vdate2'] := If_Form1.DateTimePicker2.Date + 1 ;
              //dm.ADOQALL2.Parameters.ParamValues['vptr'] := If_Form1.RadioGroup1.ItemIndex + 1;

              dm.ADOQALL2.Parameters.ParamValues['vdate1'] := FormatDateTime('yyyy-MM-dd',Vdtpk3Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk3Time);
              Dm.ADOQALL2.Parameters.ParamValues['vdate2'] := FormatDateTime('yyyy-MM-dd',Vdtpk4Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk4Time);


              dm.ADOQALL2.Prepared ;
              dm.ADOQALL2.Open ;

          end ;
  finally
      If_Form1.Free ;
  end;
end;

procedure TMainForm1.PopupMenu1Popup(Sender: TObject);
begin

  n2.Enabled := false ;

  n6.Enabled := false ;
  n8.Enabled := false ;
  n11.Enabled := false ;
  n10.Enabled := false ;
  if DBGridEh1.DataSource.DataSet.Active then
      if DBGridEh1.DataSource.DataSet.IsEmpty then
          begin

              n2.Enabled := false ;

              n6.Enabled := false ;
              n8.Enabled := false ;
              n11.Enabled := false ;
              n10.Enabled := false ;
          end
      else
          begin
              if (vprevCaption = '2') or (vprevCaption = '4') then
                  begin

                      n2.Enabled := true ;

                      n6.Enabled := true ;
                      n8.Enabled := true ;
                      n11.Enabled := true ;
                      n10.Enabled := true ;
                  end
              else
               begin
                n11.Enabled := true ;
                n10.Enabled := true ;
               end;
          end;

end;

procedure TMainForm1.CheckBox2Click(Sender: TObject);
begin
   Edit1Change(Edit1);
end;

procedure TMainForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 //if dm.ADOQALL2QTY_REJECT.AsInteger > 0  then
 //   DBGridEh1.Canvas.Font.Color := clred ;

   //DBGridEh1.Canvas.Font.Color := cllime;

  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TMainForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
      showmessage((DBGridEh1.DataSource.DataSet as TADOQuery).SQL.Text)
  else if (key = 46) and (ssCtrl in shift) then
      abort();
end;

procedure TMainForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  IF DBGridEh1.DataSource.DataSet.Active THEN
      begin
          if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then
              begin
                  exit ;
              end ;
              
          if field_name <> column.FieldName then
              begin
                  label1.Caption := column.Title.Caption ;
                  field_name := column.FieldName ;
                  edit1.SetFocus;
                  PreColumn.Title.Color := clBtnFace ;
                  Column.Title.Color := clred ;
                  PreColumn := column ;
                  Edit1Change(Edit1);
              end
          else
              edit1.SetFocus;
      end;
end;

procedure TMainForm1.N2Click(Sender: TObject);
begin
  if (vprevCaption = '1') or (vprevCaption = '3') then
      begin
          showmessage('你只有检查权限，不能更改数数据！！');
          exit;
      end;
  if not dm.ADOQALL2.IsEmpty then
      begin
          if dm.ADOQ0101.Active then dm.ADOQ0101.Close ;
          dm.ADOQ0101.Parameters.ParamValues['rkey0101'] := dm.ADOQALL2RKEY.AsInteger ;
          dm.ADOQ0101.Prepared ;
          dm.ADOQ0101.Open ;

          if dm.ADOQ0118.Active then dm.ADOQ0118.Close ;
          dm.ADOQ0118.Parameters.ParamValues['rkey0101'] := dm.ADOQALL2RKEY.AsInteger ;
          dm.ADOQ0118.Prepared ;
          dm.ADOQ0118.Open ;

          if dm.ADOQ0101.fieldbyname('status').AsInteger = 2 then
              begin
                  EditForm1 := TEditForm1.Create(application) ;
                  try

                      EditForm1.Edit14.ReadOnly := true ;
                      EditForm1.Edit13.ReadOnly := true ;
                      EditForm1.Edit12.ReadOnly := true ;
                      EditForm1.Edit15.ReadOnly := true ;
                      EditForm1.Memo4.ReadOnly := true ;
                      EditForm1.BitBtn1.Enabled :=False;
                      EditForm1.DateTimePicker1.Enabled  := false ;
                      EditForm1.ComboBox2.Enabled := false ;
                      EditForm1.Edit3.ReadOnly := true ;
                      EditForm1.Edit4.ReadOnly := true ;
                      EditForm1.DBGridEh1.ReadOnly := true ;
                      EditForm1.N1.Visible := false;
                      EditForm1.N2.Visible := false;
                      EditForm1.EditMode := 1 ;
                      dm.ADO148.Close; //打开相关文档说明表
                      dm.ADO148.Parameters[0].Value:=dm.ADOQALL2RKEY.AsInteger;
                      dm.ADO148.Open;
                      while not dm.ADO148.Eof do
                      begin
                       EditForm1.file_name.Add(dm.ADO148file_name.Value+';'+'1');
                       dm.ADO148.Next;
                      end;
                      dm.ADO148.First;
                      //EditForm1.Edit14.Text := dm.ADOQALL2LOG_NUMBER.AsString ;
                      EditForm1.user_ptrCaption := user_ptrCaption;
                      if EditForm1.ShowModal = mrok then
                          begin
                              BitBtn3Click(sender);
                          end ;
                  finally
                      EditForm1.Free ;
                  end;
              end
          else
              begin
                  dm.ADOQ0101.Close ;
                  showmessage('记录不能修改!');
              end;

      end;  {}
end;

procedure TMainForm1.N6Click(Sender: TObject);
var
  valDateTime, valDate,valdt: string ;
  valymd:tdatetime;
begin
  if dm.adoq0101.Active then dm.adoq0101.Close ;
  dm.adoq0101.Parameters.ParamValues['rkey0101'] := dm.ADOQALL2RKEY.AsInteger ;
  dm.adoq0101.Prepared ;
  dm.adoq0101.Open ;

  if dm.adoq0101.fieldbyname('status').AsInteger = 2 then
      begin
          dm.adoq0101.Edit ;
          dm.adoq0101status.AsInteger := 3;
          dm.Get_ServerDatetime(valDateTime, valDate,valdt,valymd);
          dm.ADOQ0101CLOSED_BY_PTR.AsString := user_ptrCaption ;
          dm.ADOQ0101CLOSED_DATE.AsDateTime := valymd ;


          dm.ADOConnection1.BeginTrans ;
          try
              dm.adoq0101.UpdateBatch();
              dm.ADOConnection1.CommitTrans ;
              BitBtn3Click(sender);
          except
              dm.ADOConnection1.RollbackTrans ;
          end;
      end
  else
      showmessage('不能结案');      
  dm.adoq0101.Close  ;
end;

procedure TMainForm1.N8Click(Sender: TObject);
begin
  if dm.adoq0101.Active then dm.adoq0101.Close ;
  dm.adoq0101.Parameters.ParamValues['rkey0101'] := dm.ADOQALL2RKEY.AsInteger ;
  dm.adoq0101.Prepared ;
  dm.adoq0101.Open ;

  if dm.adoq0101.fieldbyname('status').AsInteger = 3 then
      begin
          dm.adoq0101.Edit ;
          dm.adoq0101status.AsInteger := 2 ;
          dm.ADOQ0101CLOSED_BY_PTR.AsVariant := null ;
          dm.ADOQ0101CLOSED_DATE.AsVariant := null ;
          dm.ADOConnection1.BeginTrans ;
          try
              dm.adoq0101.UpdateBatch();
              dm.ADOConnection1.CommitTrans ;
              BitBtn3Click(sender);
          except
              dm.ADOConnection1.RollbackTrans ;
          end;
      end
  else
      showmessage('不能撤回');      
  dm.adoq0101.Close  ;
end;

procedure TMainForm1.N10Click(Sender: TObject);
begin
  if not dm.ADOQALL2.Active then exit;
  if dm.ADOQALL2.IsEmpty then exit;
  PrintForm1 := TPrintForm1.Create(application) ;
  try
      PrintForm1.ADOQALL2.Parameters.ParamValues['rkey0101'] := dm.ADOQALL2rkey.AsInteger  ;
      PrintForm1.ADOQALL2.Prepared ;
      PrintForm1.ADOQALL2.Open ;
      PrintForm1.ADOQ0118.Parameters.ParamValues['rkey0101'] := dm.ADOQALL2rkey.AsInteger  ;
      PrintForm1.ADOQ0118.Prepared ;
      PrintForm1.ADOQ0118.Open ;
      PrintForm1.TCompanyInfo.Prepared ;
      PrintForm1.TCompanyInfo.Open ;
      PrintForm1.ppReport1.Reset;
      PrintForm1.ppReport1.Template.FileName :=
      StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'custcomplaint.rtm';
      PrintForm1.ppReport1.Template.LoadFromFile;
      PrintForm1.ppReport1.SaveAsTemplate:=false;
      PrintForm1.ppReport1.OutlineSettings.Enabled:=False;
      PrintForm1.ppReport1.Print;
  finally
      PrintForm1.Free ;
  end;
end;

procedure TMainForm1.N11Click(Sender: TObject);
begin
  if not dm.ADOQALL2.IsEmpty then
      begin
          if dm.ADOQ0101.Active then dm.ADOQ0101.Close ;
          dm.ADOQ0101.Parameters.ParamValues['rkey0101'] := dm.ADOQALL2RKEY.AsInteger ;
          dm.ADOQ0101.Prepared ;
          dm.ADOQ0101.Open ;

          if dm.ADOQ0118.Active then dm.ADOQ0118.Close ;
          dm.ADOQ0118.Parameters.ParamValues['rkey0101'] := dm.ADOQALL2RKEY.AsInteger ;
          dm.ADOQ0118.Prepared ;
          dm.ADOQ0118.Open ;


          EditForm1 := TEditForm1.Create(application) ;
          try
              EditForm1.DBGridEh1.ReadOnly := true ;
              EditForm1.N1.Visible := false;
              EditForm1.N2.Visible := false;
              EditForm1.DBGrid4.ReadOnly := True;
              EditForm1.N30.Visible := False;
              EditForm1.N31.Visible := False;
              EditForm1.N32.Visible := False;
              EditForm1.EditMode := 2 ;
              dm.ADO148.Close; //打开相关文档说明表
              dm.ADO148.Parameters[0].Value:=dm.ADOQALL2RKEY.AsInteger;
              dm.ADO148.Open;
              while not dm.ADO148.Eof do
              begin
               EditForm1.file_name.Add(dm.ADO148file_name.Value+';'+'1');
               dm.ADO148.Next;
              end;
              dm.ADO148.First;
              //EditForm1.Edit14.Text := dm.ADOQALL2LOG_NUMBER.AsString ;
              EditForm1.user_ptrCaption := user_ptrCaption;
              if EditForm1.ShowModal = mrok then
                  begin
                      //BitBtn3Click(sender);
                  end ;
          finally
              EditForm1.Free ;
          end;


      end;  {}
end;

procedure TMainForm1.BitBtn6Click(Sender: TObject);
begin
  if (vprevCaption = '1') or (vprevCaption = '3') then
      begin
          showmessage('你只有检查权限，不能更改数数据！！');
          exit;
      end;
  if not dm.ADOQALL2.Active then exit;
  if dm.ADOQALL2.IsEmpty then exit;
  PrintForm1 := TPrintForm1.Create(application) ;
  try
      PrintForm1.ADOQALL2.Parameters.ParamValues['rkey0101'] := 0 ;
      PrintForm1.ADOQALL2.Prepared ;
      PrintForm1.ADOQALL2.Open ;
      PrintForm1.ADOQ0118.Parameters.ParamValues['rkey0101'] := 0 ;
      PrintForm1.ADOQ0118.Prepared ;
      PrintForm1.ADOQ0118.Open ;
      PrintForm1.TCompanyInfo.Prepared ;
      PrintForm1.TCompanyInfo.Open ;
      PrintForm1.ppReport1.Reset;
      PrintForm1.ppReport1.Template.FileName:=StringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'custcomplaint.rtm';
      PrintForm1.ppReport1.Template.LoadFromFile;
      PrintForm1.ppReport1.SaveAsTemplate:=true;
      PrintForm1.ppDesigner1.ShowModal ;
      //PrintForm1.ppReport1.Print;
  finally
      PrintForm1.Free ;
  end;
end;

end.
