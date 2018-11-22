unit UMain_Form;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, DateUtils, Menus, ComCtrls, Buttons,
  DB, ADODB, Grids,StrUtils ;
type
  TMain_Form = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Bevel2: TBevel;
    Shape2: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    day1: TLabel;
    Cnday: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    MenuMonth: TPopupMenu;
    MenuMonth_1: TMenuItem;
    MenuMonth_2: TMenuItem;
    MenuMonth_3: TMenuItem;
    MenuMonth_4: TMenuItem;
    MenuMonth_5: TMenuItem;
    MenuMonth_6: TMenuItem;
    MenuMonth_7: TMenuItem;
    MenuMonth_8: TMenuItem;
    MenuMonth_9: TMenuItem;
    MenuMonth_10: TMenuItem;
    MenuMonth_11: TMenuItem;
    MenuMonth_12: TMenuItem;
    MenuYear: TPopupMenu;
    image_month: TImage;
    image_year: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    image_today: TImage;
    shp1: TShape;
    PopupMenu1: TPopupMenu;
    BitBtn9: TBitBtn;
    BtnSave: TBitBtn;
    UpDown1: TUpDown;
    Edit1: TEdit;
    UpDown2: TUpDown;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    StringGrid1: TStringGrid;
    Label9: TLabel;
    PopupMenu2: TPopupMenu;
    NN1: TMenuItem;
    NN2: TMenuItem;
    NN3: TMenuItem;
    ComboBox1: TComboBox;
    procedure CnDayClick(Sender: TObject);
    procedure CHnDayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure CnDayMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  //  procedure ChnDateMouseDown(Sender: TObject; Button: TMouseButton;
  //    Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuMonth_1Click(Sender: TObject);
    procedure lbl4Click(Sender: TObject);
    procedure image_todayClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure MenuItem1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
    procedure NN1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

  private
    { Private declarations }
    procedure LoadLAB;
    procedure DateChange(MyTime: TDateTime);
    procedure init;
    procedure showdatecolor(CurDate:TLabel;CurChnDate:TLabel);
    procedure YearClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure FreshSGrid(Sender: TObject);
  public
    { Public declarations }
    FPicture_AlphaBlend: Byte;
    FPicture: TbitMap;
    NDate: Tdate;
    YearEdit, MonthEdit, DayEdit: TEdit;
    ChDateLabel: TLabel;
    procedure ShowDateWin(YearEdit1, MonthEdit1, DayEdit1: TEdit; {ChDateLabel1: TLabel;} HostControl: TControl; Bmp: TBitMap = nil; iAlphaBlend: Byte = 150);
  end;
var
  Main_Form: TMain_Form;
  CnDate: array[1..40] of TLabel;
  ChnDate: array[1..40] of TLabel;
  Shapetmp: array[1..40] of TShape;
  NYear, NMonth, NDay: Word;
  MHostControl: TControl;
  counter1,positionnum,changedflag,MutiSFlag: Integer;

implementation
uses  DateCn,UDM, UColorS,common; // 
{$R *.DFM}
function FormExists(FORM_NAME: string): BOOLEAN;
begin
  if Application.FindComponent(FORM_NAME) = nil then
    RESULT := FALSE
  else
    RESULT := TRUE;
end;
function DayOfMonth(Year, Month: Integer): integer; overload;
begin
  try
    Result := MonthDays[IsLeapYear(Year), Month];
  except
    Result := 0;
  end;
end;
function DayOfMonth(Dates: TDateTime): integer; overload;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Dates, Year, Month, day);
  Result := MonthDays[IsLeapYear(Year), Month];
end;
function DaysOfMonth(Dates: TDateTime): Integer;
begin
  Result := DayOfMonth(YearOf(Dates), MonthOf(Dates));
end;
function SetDateTime(NYear, NMonth, NDay: Word): TDate;
var
  MyDay: Word;
begin
  MyDay := DayOfMonth(NYear, NMonth);
  if MyDay < NDay then
    NDay := MyDay;
  Result := EncodeDate(NYear, NMonth, NDay);
end;

procedure TMain_Form.FormCreate(Sender: TObject);
begin
  if not App_Init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title; 
 {  dm.ADOConnection1.Open;
  rkey73:= '96';
  user_ptr := '110';
  vprev := '4';  }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TMain_Form.init;
var
  i, x, y: Integer;
  d: TDate;
  MenuItem, ChildMenuItem: TMenuItem;
begin
  DM.FactoryCalendar.Close;
  DM.FactoryCalendar.Open;
  DM.FactoryCalendar_1.Close;
  DM.FactoryCalendar_1.Open;
  counter1 := 0;
  d := StrToDate('2004-1-1');
  for i := 1 to 12 do
  begin
    TMenuItem(FindComponent('MenuMonth_' + IntToStr(i))).Caption := FormatDateTime('mmmm', d);
    d := IncMonth(d);
  end;
  x := 1901;
  i := 0;
  while x <= 2100 do
  begin
    MenuItem :=NewItem(IntToStr(x - 1),0, False, True, nil, 0, 'MenuYear_' + IntToStr(x - 1));
    MenuYear.Items.Add(MenuItem);
    y := x;
    while y < x + 10 do
    begin
      ChildMenuItem := NewItem(IntToStr(y),
        0, False, True, YearClick, 0, 'MenuYear_' + IntToStr(y));
      ChildMenuItem.Tag := y;
      MenuYear.Items[i].Add(ChildMenuItem);
      Inc(y);
    end;
    x := x + 10;
    Inc(i);
  end;
  LoadLAB;
  NDate := Date;

end;

procedure TMain_Form.FormShow(Sender: TObject);
var
  j:Integer;
begin
  DecodeDate(NDate, NYear, NMonth, NDay);
  DateChange(NDate);
   FreshSGrid(Sender);
   for j := 0 to 37 do
   begin
       Shapetmp[j]:=TShape.Create(Self);
       Shapetmp[j].Brush.Color := $0081E27E;
       Shapetmp[j].Pen.Color := clGreen;
       Shapetmp[j].Pen.Mode := pmCopy;
       Shapetmp[j].Height := 54;
       Shapetmp[j].Width := 63;
       Shapetmp[j].Tag := 99;
       Shapetmp[j].Visible := False;
       Shapetmp[j].Parent := Panel1;
       Shapetmp[j].ParentShowHint := True;
   end;
   changedflag := 0;
   MutiSFlag := 0;
   BitBtn1Click(Sender);
   BitBtn1Click(Sender);
end;

procedure TMain_Form.FreshSGrid(Sender: TObject);
var
  i:Integer;
begin
  StringGrid1.ColCount   :=5;
  StringGrid1.RowCount   :=2;
    with StringGrid1 do
    begin
          Cells[0,0]:='rkey';
          Cells[1,0]:='序号';
          Cells[2,0]:='假日类型';
          Cells[3,0]:='颜色';
          Cells[4,0]:='备注';
          FixedCols := 2;
          FixedRows := 1;
          ColWidths[0]:= -1;
          ColWidths[1]:=20;
          ColWidths[2]:=70;
          ColWidths[3]:=25;
          ColWidths[4]:=450;
          DM.Resttypemsg.Close;
          DM.Resttypemsg.Open;
          if not DM.Resttypemsg.IsEmpty then
          begin
                  i := 1;
                  DM.Resttypemsg.First;
                  while not DM.Resttypemsg.Eof do
                  begin
                       Cells[0,i] := DM.Resttypemsgrkey.AsString;
                       Cells[1,i] := IntToStr(i);
                       Cells[2,i] := DM.Resttypemsgresttype_name.AsString;
                       Cells[3,i] := DM.Resttypemsgcolor.AsString;
                       Cells[4,i] := DM.Resttypemsgremark.AsString;
                       DM.Resttypemsg.Next;
                       i := i + 1;
                       RowCount := RowCount + 1;
                  end;
                  RowCount := RowCount - 1;
          end else begin
              Cells[0,0]:='rkey';
              Cells[1,0]:='序号';
              Cells[2,0]:='假日类型';
              Cells[3,0]:='颜色';
              Cells[4,0]:='备注';
              FixedCols := 2;
              FixedRows := 1;
              ColWidths[0]:= -1;
              ColWidths[1]:=25;
              ColWidths[2]:=70;
              ColWidths[3]:=25;
              ColWidths[4]:=120;
              Cells[0,1]:='';
              Cells[1,1]:='';
              Cells[2,1]:='';
              Cells[3,1]:='';
              Cells[4,1]:='';
          end;
   end;
end;

procedure TMain_Form.LoadLAB;
var
  i: integer;
begin
  for i := 1 to 37 do
  begin
    CnDate[i] := TLabel.Create(self);
    CnDate[i].parent := Panel1;
    ChnDate[i] := TLabel.Create(self);
    ChnDate[i].parent := Panel1;
    CnDate[i].OnClick := CnDayClick;
    CnDate[i].OnMouseDown := CnDayMouseDown;
    //ChnDate[i].OnClick := ChnDayClick;
    //ChnDate[i].OnMouseDown := ChnDateMouseDown;
    CnDate[i].AutoSize := false;
    ChnDate[i].AutoSize := false;
    CnDate[i].Width := day1.Width;
    ChnDate[i].Width := Cnday.Width;
    CnDate[i].Height := day1.Height;
    ChnDate[i].Height := Cnday.Height;
    CnDate[i].Alignment := day1.Alignment;
    ChnDate[i].Alignment := Cnday.Alignment;
    CnDate[i].Layout := day1.Layout;
    ChnDate[i].Layout := Cnday.Layout;
    ChnDate[i].PopupMenu := PopupMenu1;
    CnDate[i].PopupMenu := PopupMenu1;
    if i = 1 then
    begin
      CnDate[i].Left := day1.Left;
      CnDate[i].Top := day1.Top;
      ChnDate[i].Left := Cnday.Left;
      ChnDate[i].Top := Cnday.Top;
    end
    else
    begin
      if ((i - 1) mod 7) = 0 then
      begin
        CnDate[i].Top := CnDate[i - 1].Top + 60;
        CnDate[i].Left := day1.Left;
        ChnDate[i].Top := ChnDate[i - 1].Top + 60;
        ChnDate[i].Left := Cnday.Left;
      end
      else
      begin
        CnDate[i].Top := CnDate[i - 1].Top;
        CnDate[i].Left := CnDate[i - 1].Left + 80;
        ChnDate[i].Top := ChnDate[i - 1].Top;
        ChnDate[i].Left := ChnDate[i - 1].Left + 80;
      end;
    end;
    CnDate[i].Font := day1.Font;
    ChnDate[i].Font := Cnday.Font;
    CnDate[i].Font.Color := clBlack;
    CnDate[i].AutoSize := false;
    ChnDate[i].AutoSize := false;
    CnDate[i].Transparent := true;
    ChnDate[i].Transparent := true;
  end;
end;

procedure TMain_Form.showdatecolor(CurDate:TLabel;CurChnDate:TLabel);
var
  strtmp : string;
  datetmp: TDateTime;
  c: LongInt;
  QueryTmp,QueryTmp2 : TADOQuery;
begin
  QueryTmp:=TADOQuery.Create(Self);
  QueryTmp.Connection := DM.ADOConnection1;
  QueryTmp2:=TADOQuery.Create(Self);
  QueryTmp2.Connection := DM.ADOConnection1;
  if DM.ADOConnection1.Connected then
  begin
     try
        strtmp := '';
        strtmp :=  label1.Caption + '-' + label17.Caption + '-' + CurDate.Caption;
        if   TryStrToDate(strtmp,datetmp)  then
        begin
          QueryTmp.Close;
          QueryTmp.SQL.Clear;

          QueryTmp.SQL.Text:='SELECT rkey, CalendarID, RestDate, Type FROM  dbo.FactoryCalendar WHERE RestDate = '''
            + label1.Caption + '-' + label17.Caption + '-' + CurDate.Caption + '''  and CalendarID = ' + inttostr(ComboBox1.ItemIndex) + #13;
          QueryTmp.Open;
          if not QueryTmp.IsEmpty then
          begin
            QueryTmp2.Close;
            QueryTmp2.SQL.Clear;
            QueryTmp2.SQL.Text:='SELECT rkey, resttype_name, color, remark FROM dbo.Resttypemsg WHERE rkey = '
              + QueryTmp.FieldByName('Type').AsString + #13;
            QueryTmp2.Open;
            if not QueryTmp2.IsEmpty then
            begin
              IdentToColor(QueryTmp2.FieldByName('color').AsString,c);
              CurDate.Transparent :=False;
              CurDate.Color := c;
              CurDate.Hint := QueryTmp.FieldByName('Type').AsString;
              CurChnDate.Transparent :=False;
              CurChnDate.Color := c;
              CurChnDate.Hint := QueryTmp.FieldByName('Type').AsString;
            end
            else
            begin
              CurDate.Transparent :=True;
              CurDate.Color := clWhite;
              CurDate.Hint := '';
              CurChnDate.Transparent :=True;
              CurChnDate.Color:= clWhite;
              CurChnDate.Hint := '';
            end;
          end
          else
          begin
            CurDate.Transparent :=True;
            CurDate.Color := clWhite;
            CurDate.Hint := '';
            CurChnDate.Transparent :=True;
            CurChnDate.Color:= clWhite;
            CurChnDate.Hint := '';
          end;
        end;
     except
        DM.ADOConnection1.RollbackTrans;
        showmessage('读取失败...');
     end;
  end;
  QueryTmp.free;
  QueryTmp2.free;
end;

procedure TMain_Form.DateChange(MyTime: TDateTime);
var
  i,j,S: integer;
  StarNo: integer;
  Present : TDateTime;
  Year, Month, Day: Word;
begin
  //Label20.Caption := IntToStr(DateUtils.YearOf(Mytime));
  Label17.Caption := IntToStr(DateUtils.MonthOf(Mytime));
  Edit2.Text := IntToStr(DateUtils.MonthOf(Mytime));
  //Label16.Caption := Label17.Caption;
  Label1.Caption := IntToStr(DateUtils.YearOf(Mytime));
  Edit1.Text := IntToStr(DateUtils.YearOf(Mytime));
  Label21.Caption := Copy(CnSkyStemOfYear(Mytime), 1, 2) + CnanimalOfYear(Mytime);
  lbl1.Caption := '选定日期为：'+DateToStr(Mytime);
  lbl2.Caption := Copy(CnSkyStemOfYear(Mytime), 1, 2) + Copy(CnanimalOfYear(Mytime),1,2)+'年'+CnMonthOfDate(Mytime)+CnDayOfDate(Mytime);
  lbl3.Caption := GetLunarHolDay(Mytime)+CnDayOfDateJr(Mytime)+Holiday(Mytime,DayOf(Mytime));
  for i := 1 to 37 do
  begin
    CnDate[i].Visible := false;
    ChnDate[i].Visible := false;
    CnDate[i].Color := clBlue;
    //CnDate[i].Font.Size := 11;
    CnDate[i].Color := self.Color;
    ChnDate[i].Color := self.Color;
    if (((i) mod 7) = 0) or (((i) mod 7) = 1) then
    begin
      CnDate[i].Font.Color := clRed;
      ChnDate[i].Font.Color := clRed;
    end
    else
    begin
      CnDate[i].Font.Color := clBlack;
      ChnDate[i].Font.Color := Cnday.Font.Color;
    end;
  end;
  DecodeDate(MyTime, Year, Month, Day);
  Present := EncodeDate(Year, Month, 1);
  StarNo := dayofweek(Present);
  s := starno + DayOfMonth(Present) - 1;
  positionnum := StarNo ;
  try
    for i := StarNo to s do
    begin
      Present := EncodeDate(Year, Month, i - StarNo + 1);
     // ShowMessage(CnDate[i].Caption);
      CnDate[i].Caption := IntToStr(i - StarNo + 1);
      CnDate[i].Tag := i - StarNo + 1;
      ChnDate[i].Tag := CnDate[i].Tag;
      ChnDate[i].Caption := CnDayOfDate(Present);
      if ChnDate[i].Caption = '初一' then
      begin
        ChnDate[i].Caption := CnMonthOfDate(Present);
        ChnDate[i].Font.Color := clRed;
      end ;
      if length(Holiday(MyTime, i - StarNo + 1)) > 3 then
      begin
        ChnDate[i].Caption := Holiday(MyTime, i - StarNo + 1);
        ChnDate[i].Font.Color := $000080FF;
      end;
      if DateCn.GetLunarHolDay(Present) <> '' then
      begin
        ChnDate[i].Caption := GetLunarHolDay(Present);
        ChnDate[i].Font.Color := $00FF5353;
      end;
      if DateCn.CnDayOfDateJr(Present) <> '' then
      begin
        ChnDate[i].Caption := CnDayOfDateJr(Present);
        ChnDate[i].Font.Color := $000080FF;
      end;
      if i - StarNo + 1 = day then
      begin
        Shape2.Left := CnDate[i].left -2;
        Shape2.Top := CnDate[i].top -2;
        Label22.Caption := Constellation(Present, day);
      end;
      CnDate[i].Visible := true;
      ChnDate[i].Visible := true;

    end;
  except
    on EConvertError do
    begin
      exit;
    end
  else
    exit;
  end;
              for j := 0 to 37 do
              begin
                    if (Trim(CnDate[j].Caption) <> '') and (CnDate[j].Caption <> '工厂日历') then
                    begin
                          showdatecolor(CnDate[j],ChnDate[j]);
                    end;
                    CnDate[j].HelpKeyword := '';    //多选标识
              end;
end;

procedure TMain_Form.image_todayClick(Sender: TObject);
begin
  DateChange(today);
end;

procedure TMain_Form.lbl4Click(Sender: TObject);
begin
  DateChange(today);
end;

procedure TMain_Form.ChnDayClick(Sender: TObject);
begin
  Nday := (sender as TLabel).Tag;
end;
procedure TMain_Form.CnDayClick(Sender: TObject);
begin
  Nday := (sender as TLabel).Tag;
end;
procedure TMain_Form.FormDeactivate(Sender: TObject);
begin
  Self.Close;
end;

{procedure TMain_Form.ChnDateMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Present: TDate;
  i: Integer;
begin
  if ( ssctrl in shift ) and (ssleft in shift ) then
  begin
       Shape2.Visible := False;
       if  (sender as TLabel).Hint = '' then
        begin
            (sender as TLabel).Hint := 'selected';
             Shapetmp[(sender as TLabel).tag].Visible := True;
             Shapetmp[(sender as TLabel).tag].Parent := Panel1;
             Shapetmp[(sender as TLabel).tag].Left := (sender as TLabel).left ;
             Shapetmp[(sender as TLabel).tag].Top := (sender as TLabel).top ;
             Shapetmp[(sender as TLabel).tag].SendToBack;
             MutiSFlag := MutiSFlag + 1;
       end else
       if (sender as TLabel).Hint = 'selected' then
        begin
            (sender as TLabel).Hint := '';
            Shapetmp[(sender as TLabel).tag].Visible := False;
        end;
  end else
  if (ssleft in shift ) then
  begin
        for i := 0 to 37 do
        begin
              (sender as TLabel).Hint := '';
              Shapetmp[i].Visible := False;
        end;
        Shape2.Visible := True;
        Shape2.Left := (sender as TLabel).left ;
        Shape2.Top := (sender as TLabel).top ;
        (sender as TLabel).Hint := 'selected';
        MutiSFlag := 0;
  end else
  if (ssright in shift ) then
  begin
        if (sender as TLabel).Hint <> 'selected' then
        begin
            for i := 0 to 37 do
            begin
                  (sender as TLabel).Hint := '';
                   Shapetmp[i].Visible := False;
            end;
            Shape2.Visible := True;
            Shape2.Left := (sender as TLabel).left ;
            Shape2.Top := (sender as TLabel).top ;
            MutiSFlag := 0;
        end else begin

        end;
  end;
  Nday := (sender as TLabel).Tag;
  Present := SetDateTime(NYear, NMonth, NDay);
  Label22.Caption := Constellation(Present, NDay);
  lbl1.Caption := '选定日期为：'+DateToStr(Present);
  lbl2.Caption := Copy(CnSkyStemOfYear(Present), 1, 2) + Copy(CnanimalOfYear(Present),1,2)+'年'+CnMonthOfDate(Present)+CnDayOfDate(Present);
  lbl3.Caption := GetLunarHolDay(Present)+CnDayOfDateJr(Present)+Holiday(Present,DayOf(Present));

end;  }

procedure TMain_Form.CnDayMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Present: TDate;
  i: Integer;
begin
  if ( ssctrl in shift ) and (ssleft in shift ) then
  begin
       Shape2.Visible := False;
       if  (sender as TLabel).HelpKeyword = '' then
        begin
            (sender as TLabel).HelpKeyword := 'selected';
             Shapetmp[(sender as TLabel).tag].Visible := True;
             Shapetmp[(sender as TLabel).tag].Parent := Panel1;
             Shapetmp[(sender as TLabel).tag].Left := (sender as TLabel).left - 2 ;
             Shapetmp[(sender as TLabel).tag].Top := (sender as TLabel).top - 2 ;
             Shapetmp[(sender as TLabel).tag].SendToBack;
             MutiSFlag := MutiSFlag + 1;
             changedflag := 1;
       end else
       if (sender as TLabel).HelpKeyword = 'selected' then
        begin
            (sender as TLabel).HelpKeyword := '';
            Shapetmp[(sender as TLabel).tag].Visible := False;
        end;
  end else
  if (ssleft in shift ) then
  begin
        for i := 0 to 37 do
        begin
              Shapetmp[i].Visible := False;
              CnDate[i].HelpKeyword := '';
        end;
        Shape2.Visible := True;
        Shape2.Left := (sender as TLabel).left -2 ;
        Shape2.Top := (sender as TLabel).top-2 ;
       // (sender as TLabel).HelpKeyword := 'selected';
        MutiSFlag := 0;
  end else
  if (ssright in shift ) then
  begin
        if (sender as TLabel).HelpKeyword <> 'selected' then
        begin
            for i := 0 to 37 do
            begin
                   Shapetmp[i].Visible := False;
                   CnDate[i].HelpKeyword := '';
            end;
            Shape2.Visible := True;
            Shape2.Left := (sender as TLabel).left-2 ;
            Shape2.Top := (sender as TLabel).top-2 ;
            MutiSFlag := 0;

        end else begin

        end;
        changedflag := 1;
  end;
  Nday := (sender as TLabel).Tag;
  Present := SetDateTime(NYear, NMonth, NDay);
  Label22.Caption := Constellation(Present, NDay);
  lbl1.Caption := '选定日期为：'+DateToStr(Present);
  lbl2.Caption := Copy(CnSkyStemOfYear(Present), 1, 2) + Copy(CnanimalOfYear(Present),1,2)+'年'+CnMonthOfDate(Present)+CnDayOfDate(Present);
  lbl3.Caption := GetLunarHolDay(Present)+CnDayOfDateJr(Present)+Holiday(Present,DayOf(Present));

end;

procedure TMain_Form.ShowDateWin(YearEdit1, MonthEdit1, DayEdit1: TEdit;
  HostControl: TControl; Bmp: TBitMap = nil; iAlphaBlend: Byte = 150);
begin

end;

procedure TMain_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Application.RemoveComponent(Self);
  Self := nil;
  Self.Free;
end;
procedure TMain_Form.MenuMonth_1Click(Sender: TObject);
begin

  Edit2.Text := IntToStr(TMenuItem(Sender).Tag);
  Edit2Change(Sender);
 { NMonth := TMenuItem(Sender).Tag;
  Present := SetDateTime(NYear, NMonth, NDay);
  DateChange(Present); }
end;

procedure TMain_Form.YearClick(Sender: TObject);
begin
    Edit1.Text := IntToStr(TMenuItem(Sender).Tag);
    Edit1Change(Sender);
 { NYear := TMenuItem(Sender).Tag;
  Present := SetDateTime(NYear, NMonth, NDay);
  DateChange(Present); }
end;

procedure TMain_Form.Button1Click(Sender: TObject);
begin
    ShowMessage(ColorToString(clRed));
end;

procedure TMain_Form.BitBtn9Click(Sender: TObject);
begin
 if MessageBox(Handle,'确定要关闭此程序?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDYES	then
  if changedflag = 1 then
  begin
       if MessageBox(Handle,'设定已产生变化，关闭前需要保存设定吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
              Application.Terminate
       else begin
            BtnSaveClick(nil);
            Application.Terminate;
       end;
  end else  Application.Terminate;
end;

procedure TMain_Form.Edit1Change(Sender: TObject);
var
  Present: TDate;
  i : Integer;
begin
  if changedflag = 1 then
       if MessageBox(Handle,'设定已产生变化，若变换年月，设定数据将不保存，需要保存数据吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDYES	then
           BtnSaveClick(nil);
     if Edit1.Text <> '' then
   label1.Caption :=  Edit1.Text;
    if counter1 > 1 then
    begin
        NYear := StrToInt(Edit1.Text);
        Present := SetDateTime(NYear, NMonth, NDay);
        DateChange(Present);
      if MutiSFlag > 0 then
      begin
        for i:= 0 to 37 do
        Shapetmp[i].Visible := False;
        Shape2.Visible := True
      end;
    end;
  counter1 := counter1 + 1;
  changedflag := 0;
end;


procedure TMain_Form.Edit2Change(Sender: TObject);
var
  Present: TDate;
  i: Integer;
begin
  if changedflag = 1 then
  begin
       if MessageBox(Handle,'设定已产生变化，若变换年月，设定数据将不保存，需要保存数据吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then
       else
            BtnSaveClick(nil);
  end;
  if Edit2.Text <> '' then
  label17.Caption := Edit2.Text;
   if counter1 > 2 then
   begin
      NMonth := StrToInt(Edit2.Text);
      Present := SetDateTime(NYear, NMonth, NDay);
      DateChange(Present);
      if MutiSFlag > 0 then
      begin
        for i:= 0 to 37 do
        Shapetmp[i].Visible := False;
        Shape2.Visible := True
      end;
    end;
    counter1 := counter1 + 1;
  changedflag := 0;
end;

procedure TMain_Form.BtnSaveClick(Sender: TObject);
var
    i: Integer;
    QueryTmp : TADOQuery;
    strtmp : string;
    datetmp: TDateTime;
begin
  QueryTmp:=TADOQuery.Create(Self);
  QueryTmp.Connection := DM.ADOConnection1;
  if DM.ADOConnection1.Connected then
  begin
    try
      for i := 0 to 37 do
      begin
        if CnDate[i].Transparent <> True then
        begin
          //ShowMessage(IntToStr(CnDate[i].tag));
          //ShowMessage(CnDate[i].Hint);
          strtmp := '';
          strtmp := label1.Caption+'-'+label17.Caption+'-'+CnDate[i].Caption;
          if   TryStrToDate(strtmp,datetmp)  then
          begin
            QueryTmp.Close;
            QueryTmp.SQL.Clear;
            QueryTmp.SQL.Text:='SELECT rkey, CalendarID, RestDate, Type FROM dbo.FactoryCalendar WHERE RestDate = '''
              +label1.Caption+'-'+label17.Caption+'-'+CnDate[i].Caption+''' and CalendarID = '+inttostr(ComboBox1.ItemIndex)+#13;
            QueryTmp.Open;
            if not QueryTmp.IsEmpty then
            begin
              DM.FactoryCalendar_1.Close;
              DM.FactoryCalendar_1.Parameters[0].Value  := QueryTmp.FieldByName('rkey').Value;
              DM.FactoryCalendar_1.Open;
              DM.FactoryCalendar_1.Edit;
              if CnDate[i].Hint <> '' then
              DM.FactoryCalendar_1.FieldByName('Type').Value := StrToInt(CnDate[i].Hint);
            end
            else
            begin
              DM.FactoryCalendar_1.Close;
              DM.FactoryCalendar_1.Parameters[0].Value  := -1;
              DM.FactoryCalendar_1.Open;
              DM.FactoryCalendar_1.Append;
              DM.FactoryCalendar_1.FieldByName('RestDate').AsDateTime := strtodate(label1.Caption+'-'+label17.Caption+'-'+CnDate[i].Caption);
              DM.FactoryCalendar_1.FieldByName('CalendarID').Value := ComboBox1.ItemIndex ;
              if CnDate[i].Hint <> '' then
              DM.FactoryCalendar_1.FieldByName('Type').Value := StrToInt(CnDate[i].Hint);
            end;
            DM.ADOConnection1.BeginTrans;
            DM.FactoryCalendar_1.Post;
            DM.FactoryCalendar_1.UpdateBatch(arAll);
            DM.ADOConnection1.CommitTrans;
          end;
        end
        else
        begin
          strtmp := '';
          strtmp := label1.Caption+'-'+label17.Caption+'-'+CnDate[i].Caption;
          if   TryStrToDate(strtmp,datetmp)  then
          begin
           if   TryStrToDate(strtmp,datetmp)  then
            begin
              QueryTmp.Close;
              QueryTmp.SQL.Clear;
              QueryTmp.SQL.Text:='SELECT     rkey, CalendarID, RestDate, Type FROM  dbo.FactoryCalendar WHERE RestDate = '''+label1.Caption+'-'+label17.Caption+'-'+CnDate[i].Caption+''' and CalendarID = '+inttostr(ComboBox1.ItemIndex)+#13;
              QueryTmp.Open;
              if not QueryTmp.IsEmpty then
              begin
                 DM.FactoryCalendar_1.Close;
                 DM.FactoryCalendar_1.Parameters[0].Value  := QueryTmp.FieldByName('rkey').Value;
                 DM.FactoryCalendar_1.Open;
                 dm.ADOConnection1.BeginTrans;
                 DM.FactoryCalendar_1.Delete;
                 dm.ADOConnection1.CommitTrans;
              end;
            end;
          end;
        end;
      end;
      showmessage('数据保存成功...');
    except
      DM.ADOConnection1.RollbackTrans;
      showmessage('保存数据失败...');
    end;
  end;
  QueryTmp.free;
  changedflag := 0;
end;

procedure TMain_Form.BitBtn1Click(Sender: TObject);
begin
  if Panel2.Visible = True then
  begin
    BitBtn1.Caption := '>';
    Panel2.Visible := False;
    Main_Form.Width := 665;
  end
  else
  begin
    BitBtn1.Caption := '<';
    Panel2.Visible := True;
    Main_Form.Width := 880;
    Panel2.Width := 215;
  end;
end;

procedure TMain_Form.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
     if (ACol=0) or (ARow=0) then Exit;
       if StringGrid1.cells[3,ARow] <> '' then
       begin
          StringGrid1.Canvas.Brush.Color := StringToColor(StringGrid1.cells[3,ARow]);
          StringGrid1.Canvas.FillRect(StringGrid1.CellRect(3,ARow) ) ;
       end;
end;

procedure TMain_Form.PopupMenu1Popup(Sender: TObject);
var
  i : Integer;
  Item:TMenuItem;
begin
           PopupMenu1.Items.Clear;
          if not DM.Resttypemsg.IsEmpty then
          begin
                  i := 0;
                  DM.Resttypemsg.First;
                  while not DM.Resttypemsg.Eof do
                  begin
                      Item:=TMenuItem.Create(Self);
                      Item.Caption := '■'+DM.Resttypemsgresttype_name.AsString;
                      Item.Hint := DM.Resttypemsgcolor.AsString;
                      Item.Name := 'N'+IntToStr(i);
                      Item.Tag := DM.Resttypemsgrkey.AsInteger;
                      Item.OnDrawItem :=  MenuItem1DrawItem;
                      Item.OnClick := MenuItem1Click;
                      PopupMenu1.Items.Add(Item);
                      DM.Resttypemsg.Next;
                      i := i + 1;
                      //Item.Free;
                  end;
                  Item:=TMenuItem.Create(Self);
                  Item.Caption := '■取消设定';
                  Item.Hint := 'clWhite';
                  Item.Name := 'H'+IntToStr(i);
                  Item.Tag := 0;
                  Item.OnDrawItem :=  MenuItem1DrawItem;
                  Item.OnClick := MenuItem1Click;
                  PopupMenu1.Items.Add(Item);
          end;

end;

procedure TMain_Form.MenuItem1Click(Sender: TObject);
var
    c:LongInt;
    i: Integer;
begin

  if MutiSFlag > 0 then
  begin
              if (sender   as   TMenuItem).Tag = 0 then
              begin
                   for i := 0 to 37 do
                   if  CnDate[i].HelpKeyword = 'selected' then
                   begin
                           CnDate[i].Transparent := True;
                           ChnDate[i].Transparent := True;
                   end;
              end else begin
                   for i := 0 to 37 do
                      if  CnDate[i].HelpKeyword = 'selected' then
                      begin
                         IdentToColor((sender   as   TMenuItem).Hint,c);
                         CnDate[i].Transparent := False;
                         CnDate[i].Color := c;
                         CnDate[i].Hint := IntToStr((sender   as   TMenuItem).Tag);
                         ChnDate[i].Transparent := False;
                         ChnDate[i].Color := c;
                         ChnDate[i].Hint := IntToStr((sender   as   TMenuItem).Tag);
                      end;
              end;
  end else begin
         if (sender   as   TMenuItem).Tag = 0 then
         begin
            CnDate[positionnum+nday-1].Transparent := True;
            ChnDate[positionnum+nday-1].Transparent := True;
         end else begin
                IdentToColor((sender   as   TMenuItem).Hint,c);
               CnDate[positionnum+nday-1].Transparent := False;
               CnDate[positionnum+nday-1].Color := c;
               CnDate[positionnum+nday-1].Hint := IntToStr((sender   as   TMenuItem).Tag);
               ChnDate[positionnum+nday-1].Transparent := False;
               ChnDate[positionnum+nday-1].Color := c;
               ChnDate[positionnum+nday-1].Hint := IntToStr((sender   as   TMenuItem).Tag);
         end;
         changedflag := 1;
  end;
end;

procedure TMain_Form.MenuItem1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
var
    c:LongInt;
begin
     IdentToColor((sender   as   TMenuItem).Hint,c);
     ACanvas.Font.Color := c;
     acanvas.TextOut(arect.Left,arect.Top,(sender   as   TMenuItem).Caption);
end;

procedure TMain_Form.NN1Click(Sender: TObject);
var
  j:Integer;
  QueryTmp : TADOQuery;
begin
  QueryTmp:=TADOQuery.Create(Self);
  QueryTmp.Connection := DM.ADOConnection1;
  case Tmenuitem(Sender).Tag of
        0,1: with TColorS_Form.Create(nil) do
        try
             Ftag:=Tmenuitem(Sender).Tag;
             if stringgrid1.Cells[0,stringgrid1.Row] <> '' then
             frkey := StrToInt(stringgrid1.Cells[0,stringgrid1.Row]);
             initd;
             if showmodal=mrok then
             begin

             end;
        finally
             free;
        end;
        2: begin
                 if MessageBox(Handle,'一旦删除此定义，所有被该定义的日期记录均被删除，确定删除此记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
                  DM.ADOConnection1.BeginTrans;
                  try

                    QueryTmp.Close;
                    QueryTmp.SQL.Clear;
                    if stringgrid1.Cells[0,stringgrid1.Row] <> '' then
                    DM.FactoryCalendar_1.Parameters[0].Value := stringgrid1.Cells[0,stringgrid1.Row];
                    if not DM.FactoryCalendar_1.IsEmpty then
                      QueryTmp.SQL.Text:='delete from Resttypemsg where rkey = '+stringgrid1.Cells[0,stringgrid1.Row]+#13+#13
                      +'delete from FactoryCalendar where Type = '+stringgrid1.Cells[0,stringgrid1.Row]+#13+#13
                    else
                    QueryTmp.SQL.Text:='delete from Resttypemsg where rkey = '+stringgrid1.Cells[0,stringgrid1.Row]+#13+#13;
                    if QueryTmp.ExecSQL=0 then
                    begin
                            DM.ADOConnection1.RollbackTrans;
                            showmessage('删除数据失败,数据状态已发生变化...');
                    end else
                            DM.ADOConnection1.CommitTrans;
                  except
                    DM.ADOConnection1.RollbackTrans;
                    showmessage('删除数据失败...');
                  end;
                  QueryTmp.Free;
                  FreshSGrid(Sender);
           end;
  end;
  FreshSGrid(Sender);
  for j := 0 to 37 do
  begin
                    if (Trim(CnDate[j].Caption) <> '') and (CnDate[j].Caption <> '工厂日历') then
                    begin
                          showdatecolor(CnDate[j],ChnDate[j]);
                    end;
                    CnDate[j].Hint := '';    //多选标识
  end;

end;

procedure TMain_Form.PopupMenu2Popup(Sender: TObject);
begin
    if StringGrid1.Cells[0,1] = '' then
    begin
          NN2.Enabled := False;
          NN3.Enabled := False
    end else begin
          NN2.Enabled := True;
          NN3.Enabled := True;
    end;
end;

procedure TMain_Form.ComboBox1Change(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to 37 do
  begin
    if (Trim(CnDate[i].Caption) <> '') and (CnDate[i].Caption <> '工厂日历') then
    begin
      showdatecolor(CnDate[i],ChnDate[i]);
    end;
    CnDate[i].Hint := '';    //多选标识
  end;
end;

end.

