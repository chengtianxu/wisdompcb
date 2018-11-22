unit MainUNIT1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus, DB, ADODB,DateUtils;

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
    DBGrid1: TDBGrid;
    PopupMenu2: TPopupMenu;
    DataSource1: TDataSource;
    sgrid1: TStringGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
                                    DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
                             Shift: TShiftState);
  private
    { Private declarations }
    vopen2:boolean;
    PreColumn: TColumn;
    field_name:string;

    OldGridWnd : TWndMethod;
    ADOQuery1sql :string;
    Vdtpk3Date : tdate;
    Vdtpk4Date :tdate;

    procedure NewGridWnd (var Message : TMessage);
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

type
 TMyDBGrid=class(TDBGrid);

var
  MainForm1: TMainForm1;

implementation

USES
   common , DmUnit1
   ,IF_Unit1
   


    ;

{$R *.dfm}

procedure TMainForm1.BitBtn1Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TMainForm1.BitBtn2Click(Sender: TObject);
begin
  IF DBGrid1.DataSource.DataSet.Active THEN
      IF DBGrid1.DataSource.DataSet.RecordCount > 0 THEN
          Export_dbGrid_to_Excel(DBGrid1,'产品型号') ;
end;

procedure TMainForm1.BitBtn5Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMainForm1.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin
  if vopen2 then
      begin
          i := -1 ;
          IF DBGrid1.DataSource.DataSet.Active THEN
              begin
                  if not DBGrid1.DataSource.DataSet.FieldByName('rkey').IsNull then
                      i := DBGrid1.DataSource.DataSet.FieldValues['rkey'] ;
                  DBGrid1.DataSource.DataSet.Close ;
              end;
          DBGrid1.DataSource.DataSet.Open ;
          if i <> -1 then DBGrid1.DataSource.DataSet.Locate('rkey',i,[]);
      end;
end;

procedure TMainForm1.FormCreate(Sender: TObject);

begin
  vopen2 := false;

  if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;

  {}

  
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;

  Vdtpk3Date := EncodeDate(YearOf(now()),MonthOf(now()),dayof(now()));
  Vdtpk4Date := EncodeDate(YearOf(now()),MonthOf(now()),dayof(now()));//now();
  ADOQuery1sql := '' ;
  //showmessage(ADOQuery1sql);

end;

procedure TMainForm1.NewGridWnd(var Message: TMessage);
var
  IsNeg : Boolean;
begin
  if Message.Msg = WM_MOUSEWHEEL then
      begin
          IsNeg := Short(Message.WParamHi) < 0;
          if IsNeg then
              DBGrid1.DataSource.DataSet.MoveBy(1)
          else
              DBGrid1.DataSource.DataSet.MoveBy(-1)
      end
  else
      OldGridWnd(Message);
end;

procedure TMainForm1.FormShow(Sender: TObject);
var
  i:byte;
  item:TMenuItem;
begin
  { }

  if not dm.ADOConnection1.Connected then
      application.Terminate ;

  field_name := DBGrid1.Columns[0].FieldName ;
  PreColumn := DBGrid1.Columns[0] ;

  Label1.Caption := DBGrid1.Columns[0].Title.caption ; 

  for i:=1 to DBGrid1.Columns.Count do
      begin
          item := TmenuItem.Create(self) ;
          item.Caption := dbgrid1.Columns[i-1].Title.Caption ;
          //if dbgrid1.Columns[i-1].Visible then
              item.Checked := dbgrid1.Columns[i-1].Visible ;

          item.OnClick := item_click ;
          self.PopupMenu2.Items.Add(item) ;
      end;

  if ADOQuery1sql = '' then
      ADOQuery1sql := dm.ADOQuery1.SQL.Text ;
  //showmessage(ADOQuery1sql);


  {
  dm.ADOQuery1.Parameters.ParamValues['From_DATE'] := Vdtpk3Date  ;
  dm.ADOQuery1.Parameters.ParamValues['TO_DATE'] := Vdtpk4Date  ;
  dm.ADOQuery1.Prepared ;
  dm.ADOQuery1.Open ;
  {}
end;

procedure TMainForm1.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to dbgrid1.FieldCount-1 do
              if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
                  begin
                      dbgrid1.Columns[i].Visible:=true;
                      break;
                  end;
      end
  else
      begin
          for i := 0 to dbgrid1.FieldCount-1 do
              if dbgrid1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      dbgrid1.Columns[i].Visible := false;
                      break;
                  end;
      end;
end;

procedure TMainForm1.DBGrid1TitleClick(Column: TColumn);
begin
  IF dbgrid1.DataSource.DataSet.Active THEN
      begin
          if field_name<>column.FieldName then
              begin
                  field_name := column.FieldName;
                  label1.Caption := column.Title.Caption;
                  edit1.Text := '' ;
                  edit1.SetFocus;
                  PreColumn.Title.Color := clBtnFace;
                  Column.Title.Color := clred;
                  PreColumn := column;
                  TADOQuery(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';

              end
          else if field_name = column.FieldName then
              begin
                  edit1.SetFocus;
                  PreColumn.Title.Color := clBtnFace;
                  Column.Title.Color := clred;
                  PreColumn := column;
                  TADOQuery(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';

              end;
      end
  else
      showmessage('没有打开数据，请按: 查询 ');

end;

procedure TMainForm1.Edit1Change(Sender: TObject);
var
  s:string;
begin

  IF dbgrid1.DataSource.DataSet.Active  THEN
      begin
          //dbgrid1.DataSource.DataSet.Filter := '';
          DM.ADOQuery1.Filter := '';
          s:= '';

          if trim(Edit1.text) <> '' then
              begin
                  if dm.ADOQuery1.Fields.FieldByName(field_name).DataType  in [ftString,ftWideString]  then
                      begin
                          if s = '' then
                              s := field_name+' like ''%'+trim(edit1.text)+'%'''
                          else
                              s :=s +' and '+ field_name+' like ''%'+trim(edit1.text)+'%''' ;
                      end
                  else if dm.ADOQuery1.Fields.FieldByName(field_name).DataType  in [ftSmallint, ftInteger, ftWord]  then
                      begin
                          try
                              strtoint(edit1.Text);
                              if s = '' then
                                  s := field_name+' = '+trim(edit1.text)
                              else
                                  s :=s + ' and ' + field_name+' = '+trim(edit1.text) ;
                          except
                              showmessage('输入的内容不相符，只能输入数字');
                          end;
                      end
                  else if dm.ADOQuery1.Fields.FieldByName(field_name).DataType  in [ftDate,ftTime, ftDateTime] then
                      begin
                          try
                              strtodatetime(edit1.Text);
                              if s = '' then
                                  s := field_name+' = '''+ trim(edit1.text) +''''
                              else
                                  s := s +' and '+ field_name+' = '''+ trim(edit1.text) +'''';
                          except
                              //showmessage('输入的内容不相符，只能输入日期') ;
                          end;
                      end;
              end ;
          //dbgrid1.DataSource.DataSet.Filter := s;
          //SHOWMESSAGE(S);
          DM.ADOQuery1.Filter := S;
          //else
              //dbgrid1.DataSource.DataSet.Filter := '' ;
      end ;
end;

procedure TMainForm1.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdFixed in State) then
       if DBGrid1.DataSource.DataSet.Active then
           begin

               if DBGrid1.DataSource.DataSet.RecNo  mod 2 = 0 then
                   begin
                       DBGrid1.Canvas.Brush.Color := clwhite;
                       DBGrid1.Canvas.FillRect(rect);  {}
                   end
               else
                   begin
                       DBGrid1.Canvas.Brush.Color := RGB(244,241,255);
                       DBGrid1.Canvas.FillRect(rect);{}
                   end ;
               if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
                   begin
                       DBGrid1.Canvas.Brush.Color :=  RGB(0,224,224);
                       DBGrid1.Canvas.FillRect(rect);
                   end; {}
                DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
           end;
           
with TMyDBGrid(Sender) do
 begin
  if DataLink.ActiveRecord=Row-1 then
   begin
    Canvas.Font.Color:=clWhite;
    Canvas.Brush.Color:=$00800040;
   end
  else
   begin
    Canvas.Brush.Color:=Color;
    Canvas.Font.Color:=Font.Color;
   end;

//  if dm.ads494flow_spfc_flag.Value='Y' then
//   Canvas.Font.Color := clred;

  DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;
end;

procedure TMainForm1.BitBtn4Click(Sender: TObject);
var
  i,j :integer;
begin
  if If_Form1 = nil then If_Form1:= TIf_Form1.Create(application) ;

  If_Form1.dtpk1.Date := Vdtpk3Date ;
  If_Form1.dtpk2.Date := Vdtpk4Date ;

  {
  If_Form1.sgrid1.RowCount := sgrid1.RowCount;
  for j := 0 to sgrid1.ColCount - 1 do
       for i := 1 to sgrid1.RowCount - 2 do
           If_Form1.sgrid1.Cells[j,i] := sgrid1.Cells[j,i];
  {}

  if If_Form1.ShowModal=mrok then
      begin
          vopen2 := true;
          Vdtpk3Date :=  If_Form1.dtpk1.Date ;
          Vdtpk4Date := If_Form1.dtpk2.Date ;
          sgrid1.RowCount := If_Form1.sgrid1.RowCount ;
          sgrid1.ColCount := If_Form1.sgrid1.ColCount ;
          for j := 0 to sgrid1.ColCount - 1 do
             for i := 1 to sgrid1.RowCount - 1 do
                 sgrid1.Cells[j,i] := '' ;

          for j := 0 to sgrid1.ColCount - 1 do
             for i := 1 to sgrid1.RowCount - 2 do
                 sgrid1.Cells[j,i] := If_Form1.sgrid1.Cells[j,i];

          if dm.ADOQuery1.Active then dm.ADOQuery1.Close ;
          dm.ADOQuery1.SQL.Clear ;
          dm.ADOQuery1.SQL.Add(ADOQuery1SQL);
          for i := 1 to If_Form1.sgrid1.RowCount-2  do
              begin
                  //showmessage(trim(If_Form1.sgrid1.Cells[2,i]));
                  dm.ADOQuery1.SQL.Add(trim(If_Form1.sgrid1.Cells[2,i]));
              end;
          case  If_Form1.ComboBox2.ItemIndex of
          0:begin
            dm.ADOQuery1.SQL.Add('and data0025.CUSTPART_ENT_DATE >= '''+formatdatetime('yyyy-mm-dd',If_Form1.dtpk1.Date)+'''');
            dm.ADOQuery1.SQL.Add('and data0025.CUSTPART_ENT_DATE <= '''+formatdatetime('yyyy-mm-dd',If_Form1.dtpk2.Date)+'''');
            end;
          1:begin
            dm.ADOQuery1.SQL.Add('and data0025.LAST_MODIFIED_DATE >= '''+formatdatetime('yyyy-mm-dd',If_Form1.dtpk1.Date)+'''');
            dm.ADOQuery1.SQL.Add('and data0025.LAST_MODIFIED_DATE-1 <= '''+formatdatetime('yyyy-mm-dd',If_Form1.dtpk2.Date)+'''');
            end;
          2:begin
            dm.ADOQuery1.SQL.Add('and data0025.AUDITED_DATE >= '''+formatdatetime('yyyy-mm-dd',If_Form1.dtpk1.Date)+'''');
            dm.ADOQuery1.SQL.Add('and data0025.AUDITED_DATE <= '''+formatdatetime('yyyy-mm-dd',If_Form1.dtpk2.Date)+'''');
            end;
          end;
          //showmessage(dm.ADOQuery1.SQL.Text);
          dm.ADOQuery1.Prepared ;
          dm.ADOQuery1.Open ;

      end ;
end;

procedure TMainForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
      showmessage((DBGrid1.DataSource.DataSet as TADOQuery).SQL.Text);
end;

end.
