unit MainUNIT1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus, DB, ADODB,DateUtils,
  DBGridEh
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
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    DBGridEh1: TDBGridEh;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
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
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;
    user_ptrCaption,vprevCaption,db_ptrCaption :string;

    ADOQALL2sql :string;
    Vdtpk3Date : tdate;
    Vdtpk4Date :tdate;
    vord_req_qtycaption,vwip_qtycaption,vfg_qtycaption:string;
    vmarkCaption:integer;//投产类型　0:按订单投产 ;1:按产品投产　2：按MRB投产


    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  MainForm1: TMainForm1;

implementation

uses
   common ,
   DmUnit1
   ,IF_Unit1
   ,ConstVar
   ,EditUnit1
   ;

{$R *.dfm}


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


//  user_ptrCaption := '4';
//  vprevCaption := '4';
//  dm.ADOConnection1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  Vdtpk3Date := EncodeDate(YearOf(now()),MonthOf(now()),1);
  Vdtpk4Date := now();
  ADOQALL2sql := '' ;
  field_name := DBGridEh1.Columns[0].FieldName;
  Label1.Caption := DBGridEh1.Columns[0].Title.Caption ;
  PreColumn := DBGridEh1.Columns[0];
end;


procedure TMainForm1.BitBtn1Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TMainForm1.BitBtn2Click(Sender: TObject);
begin
  IF DBGridEh1.DataSource.DataSet.Active THEN
      IF DBGridEh1.DataSource.DataSet.RecordCount > 0 THEN
          Export_dbGridEH_to_Excel(DBGridEh1,'生产投产管理') ;
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

procedure TMainForm1.FormShow(Sender: TObject);
var
  i:byte;
  item:TMenuItem;
begin
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

  if ADOQALL2sql = '' then  ADOQALL2sql := dm.ADOQALL2.SQL.Text ;
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
                      break;
                  end;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false;
                      break;
                  end;
      end;
end;

procedure TMainForm1.Edit1Change(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind <> fkCalculated then
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then   //, ftWord,
          begin
              DBGridEh1.DataSource.DataSet.Filter := '';


              if trim(Edit1.text) <> '' then
                  begin
                      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
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
  i :integer;
begin
  If_Form1:= TIf_Form1.Create(application) ;
  try
//      If_Form1.DateTimePicker1.Date := Vdtpk3Date ;
//      If_Form1.DateTimePicker2.Date := Vdtpk4Date ;

      if If_Form1.ShowModal = mrok then
          begin
  //            Vdtpk3Date :=  If_Form1.DateTimePicker1.Date;
  //            Vdtpk4Date := If_Form1.DateTimePicker2.Date  ;
              {
              sgrid1.RowCount := If_Form1.sgrid1.RowCount ;
              sgrid1.ColCount := If_Form1.sgrid1.ColCount ;
              for j := 0 to sgrid1.ColCount - 1 do
                  for i := 1 to sgrid1.RowCount - 1 do
                      sgrid1.Cells[j,i] := '';

              for j := 0 to sgrid1.ColCount - 1 do
                  for i := 1 to sgrid1.RowCount - 2 do
                      sgrid1.Cells[j,i] := If_Form1.sgrid1.Cells[j,i];
              }
              if dm.ADOQALL2.Active then dm.ADOQALL2.Close ;
              dm.ADOQALL2.SQL.Clear ;
              dm.ADOQALL2.SQL.Add(ADOQALL2SQL);
              for i := 1 to If_Form1.sgrid1.RowCount - 2  do
                 dm.ADOQALL2.SQL.Add(trim(If_Form1.sgrid1.Cells[2,i]));
              dm.ADOQALL2.Prepared ;
              dm.ADOQALL2.Open ;

          end ;
  finally
      If_Form1.Free ;
  end;
end;

procedure TMainForm1.PopupMenu1Popup(Sender: TObject);
begin
  n7.Enabled := false ;
  n8.Enabled := false ;
  n1.Enabled := false;

  if DBGridEh1.DataSource.DataSet.Active then
      if DBGridEh1.DataSource.DataSet.IsEmpty then
          begin
              n7.Enabled := false ;
              n8.Enabled := false ;
              n1.Enabled := false;
              if (vprevCaption = '2') or (vprevCaption = '4') then
                  begin
                      n7.Enabled := true ;
                  end;
          end
      else
          begin
              if (vprevCaption = '2') or (vprevCaption = '4') then
                  begin
                      n7.Enabled := true ;
                      n8.Enabled := true ;
                      n1.Enabled := true ;
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

procedure TMainForm1.N7Click(Sender: TObject);
//var
//  valDateTime, valDate,valdt: string ;
//  valymd:tdatetime;
begin
  if (vprevCaption = '1') or (vprevCaption = '3') then
      begin
          showmessage('你只有检查权限，不能更改数数据！！');
          exit;
      end;
  EditForm1 := TEditForm1.Create(application) ;
  try
      EditForm1.EditMode := 0;
      if EditForm1.ShowModal = mrok then
          begin
              dm.ADOQALL2.Close ;
              dm.ADOQALL2.Open ;
          end ;
  finally
      EditForm1.Free ;
  end;
end;

procedure TMainForm1.N8Click(Sender: TObject);
begin
  if (vprevCaption = '1') or (vprevCaption = '3') then
      begin
          showmessage('你只有检查权限，不能更改数数据！！');
          exit;
      end;
  if dm.ADOQALL2.IsEmpty then  exit;

  EditForm1 := TEditForm1.Create(application) ;
  try
      EditForm1.EditMode := 1;
      EditForm1.key0039 := dm.ADOQALL2RKEY.Value ;
      if EditForm1.ShowModal = mrok then
          begin
              dm.ADOQALL2.Close ;
              dm.ADOQALL2.Open ;
          end ;
  finally
      EditForm1.Free ;
  end;
end;

procedure TMainForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.Active then
  begin
    if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ;
    if column.Title.SortMarker =smDownEh then
    begin
      column.Title.SortMarker:=smUpEh;
      dm.ADOQAll2.Sort:=Column.FieldName;
    end
   else
    begin
      column.Title.SortMarker:=smDownEh;
      dm.ADOQAll2.Sort:=Column.FieldName+' DESC';
    end;

    if field_name <> column.FieldName then
    begin
      label1.Caption := column.Title.Caption ;
      field_name := column.FieldName ;
      edit1.SetFocus;
      PreColumn.Title.Color := clBtnFace ;
      Column.Title.Color := clred ;
      PreColumn := column ;
      Edit1Change(Edit1);
    end else
      edit1.SetFocus;
  end;
end;

procedure TMainForm1.N4Click(Sender: TObject);
begin
  if dm.ADOQALL2.IsEmpty then  exit;
  EditForm1 := TEditForm1.Create(application) ;
  try
      EditForm1.EditMode := 2 ;
      EditForm1.key0039 := dm.ADOQALL2RKEY.Value ;
      EditForm1.ShowModal;
  finally
      EditForm1.Free ;
  end;
end;

procedure TMainForm1.N1Click(Sender: TObject);
begin
  if (vprevCaption = '1') or (vprevCaption = '3') then
      begin
          showmessage('你只有检查权限，不能更改数数据！！');
          exit;
      end;
  if dm.ADOQALL2.IsEmpty then  exit;
  if messagedlg('是否删除此记录吗？',mtconfirmation,[mbYes,mbNo],0)= mrYes then
      begin
          if dm.TemADOQuery1.Active then dm.TemADOQuery1.Close ;
          dm.TemADOQuery1.SQL.Clear ;
          dm.TemADOQuery1.SQL.Add('SELECT rkey FROM DATA0058 where REJECT_PTR =' + dm.ADOQALL2rkey.AsString );
          dm.TemADOQuery1.SQL.Add('union');
          dm.TemADOQuery1.SQL.Add('SELECT rkey FROM DATA0099 where REJECT_CODE_PTR = ' + dm.ADOQALL2rkey.AsString) ;
          dm.TemADOQuery1.SQL.Add('union');
          dm.TemADOQuery1.SQL.Add('SELECT rkey FROM DATA0401 where reject_ptr = ' + dm.ADOQALL2rkey.AsString) ;

          dm.TemADOQuery1.Prepared ;
          dm.TemADOQuery1.Open ;
          if dm.TemADOQuery1.IsEmpty then
              begin
                   if dm.ad39.Active then dm.AD39.Close ;
                   if dm.AD40.Active then dm.AD40.Close ;
                   dm.AD39.Parameters.ParamValues['rkey39'] := dm.ADOQALL2rkey.Value  ;
                   dm.AD40.Parameters.ParamValues['rkey39'] := dm.ADOQALL2rkey.Value  ;
                   dm.AD39.Prepared ;
                   dm.AD39.Open ;
                   dm.AD40.Prepared ;
                   dm.AD40.Open ;
                   try
                       dm.ADOConnection1.BeginTrans ;
                       while not dm.AD40.Eof do
                           dm.AD40.Delete ;
                       dm.AD39.Delete ;
                       dm.AD40.UpdateBatch();
                       dm.AD39.UpdateBatch() ;
                       dm.ADOConnection1.CommitTrans ;
                       dm.ADOQALL2.Close ;
                       dm.ADOQALL2.Open ;

                   except
                       on E: Exception do
                            begin
                                dm.ADOConnection1.RollbackTrans ;
                                MessageDlg(E.Message,mtError, [mbOk], 0);
                            end;
                   end;
              end
          else
              showmessage('此报废原因在其它地方有使用,不能删除!');

      end;
end;

end.
