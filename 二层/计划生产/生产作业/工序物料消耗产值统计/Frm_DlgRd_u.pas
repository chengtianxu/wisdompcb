unit Frm_DlgRd_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ShellCtrls, FileCtrl,ComObj;

type
  TFrm_DlgRd = class(TForm)
    RadioGroup1: TRadioGroup;
    RdBtn1: TRadioButton;
    RdBtnAll: TRadioButton;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Animate1: TAnimate;
    RichEdit1: TRichEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure ReadExl;
    procedure ReadRTF;
  public
    FfileType:integer;
  end;

var
  Frm_DlgRd: TFrm_DlgRd;

implementation
uses dm_u;
{$R *.dfm}

procedure TFrm_DlgRd.BitBtn1Click(Sender: TObject);
begin
  if not DM.ADO572.Active then
  begin
    if Fistate=2 then  //edit
      DM.ADO572.Parameters[0].Value:=DM.ADO570RKEY.AsInteger
    else
      DM.ADO572.Parameters[0].Value:=-1;
    DM.ADO572.Open;
  end;
  if FfileType=0 then ReadExl else ReadRTF;
end;

procedure TFrm_DlgRd.ReadExl;
var ExcelApp,MyworkBook:variant;
    sDir:string;
    i,j:integer;
begin
  try
    ExcelApp:=CreateOleObject('Excel.Application');
  except
    application.Messagebox('无法打开Xls文件，请确认已经安装EXCEL.','',mb_OK+mb_IconStop);
    Exit;
  end;
  DirectoryListBox1.OpenCurrent;
  sDir:=DirectoryListBox1.Directory;
  if sDir[length(sDir)]<>'\' then sDir:=sDir+'\';
  Animate1.Visible:=true;
  Animate1.Active:=true;
  if RdBtnAll.Checked then
  begin
    DM.ADO571.DisableControls;
    DM.ADO571.First;
    while not DM.ADO571.Eof do
    begin
      if not fileexists(sDir+DM.ADO571MANU_PART_NUMBER.AsString+'.xls') then
      begin
        ExcelApp.Quit;
        ExcelApp:=varnull;
        showmessage('文件'+sDir+DM.ADO571MANU_PART_NUMBER.AsString+'.xls不存在');
        DM.ADO571.EnableControls;
        Animate1.Active:=false;
        exit;
      end else begin
        DM.ADO572.Filter:='recno_number='+DM.ADO571recno_number.AsString;
        while not DM.ADO572.Eof do DM.ADO572.Delete;
      end;
      MyworkBook:=ExcelApp.workBooks.Open(sDir+DM.ADO571MANU_PART_NUMBER.AsString+'.xls');

      for i:=2 to 1000  do
      begin
        if MyWorkBook.WorkSheets[1].Cells[i,1].Value=varEmpty then break;
        DM.ADO572.Append;
        for j:=1 to 5 do
          DM.ADO572.Fields[j+1].Value:=MyWorkBook.WorkSheets[1].Cells[i,j].Value;
        DM.ADO572.Post;
      end;
      DM.ADO571.Next;
    end;
    DM.ADO571.EnableControls;
  end else begin
    if not fileexists(sDir+DM.ADO571MANU_PART_NUMBER.AsString+'.xls') then
    begin
      ExcelApp.Quit;
      showmessage('文件'+sDir+DM.ADO571MANU_PART_NUMBER.AsString+'.xls不存在');
      Animate1.Active:=false;
      exit;
      end else begin
        DM.ADO572.Filter:='recno_number='+DM.ADO571recno_number.AsString;
        while not DM.ADO572.Eof do DM.ADO572.Delete;
      end;
    MyworkBook:=ExcelApp.workBooks.Open(sDir+DM.ADO571MANU_PART_NUMBER.AsString+'.xls');
    for i:=2 to 10000  do
    begin
      if MyWorkBook.WorkSheets[1].Cells[i,1].Value=varEmpty then break;
      DM.ADO572.Append;
      for j:=1 to 5 do
        DM.ADO572.Fields[j+1].Value:=MyWorkBook.WorkSheets[1].Cells[i,j].Value;
      DM.ADO572.Post;
    end;
  end;
  ExcelApp.Quit;
  ExcelApp:=varnull;
  Animate1.Active:=false;
  modalresult:=mrok;
end;

procedure TFrm_DlgRd.ReadRTF;
var  sDir:string;
    procedure excut;
    var  j,k,m,E:integer;
         s,s1:string;
         SearchRec: TSearchRec;
    begin
      E:=0;
      if FindFirst(sDir+DM.ADO571MANU_PART_NUMBER.AsString+'*.rtf',faAnyFile,SearchRec)=0 then
      begin
        inc(E);
        if E=1 then
        begin
          DM.ADO572.Filter:='recno_number='+DM.ADO571recno_number.AsString;
          DM.ADO572.First;
          while not DM.ADO572.Eof do DM.ADO572.Delete;
        end;
        repeat
          RichEdit1.Lines.Clear;
          RichEdit1.Lines.LoadFromFile(sDir+SearchRec.Name);
          for j:=1 to RichEdit1.Lines.Count-1 do
          begin
            s:=RichEdit1.Lines[j];
            DM.ADO572.Append;
            DM.ADO572bach_num.Value:=strtoint(copy(SearchRec.Name,length(DM.ADO571MANU_PART_NUMBER.AsString)+2,3));

            for k:=1 to length(s) do if s[k]=#9 then break;
            DM.ADO572se_num.Value:=strtoint(trim(copy(RichEdit1.Lines[j],1,k-1)));

            for m:=k+1 to length(s) do if s[m]=#9 then break;
            DM.ADO572au_umply.Value:=strtofloat(trim(copy(RichEdit1.Lines[j],k+1,m-1-k)));

            for k:=length(s) downto 1 do
            if s[k]=#9 then
            begin
              s1:=trim(copy(s,k+1,length(s)-k));
              break;
            end;
            for m:=k-1 downto 1 do
            if s[m]=#9 then
            begin
              s1:=trim(copy(s,m+1,k-m-1))+' '+s1;
              break;
            end;
            DM.ADO572measure_date.Value:=strtodatetime(s1+':00');

            DM.ADO572.Post;
          end;
        until FindNext(SearchRec)<>0;
      end;
      FindClose(SearchRec);
      if E=0 then
      begin
        Animate1.Active:=false;
        showmessage('文件'+sDir+DM.ADO571MANU_PART_NUMBER.AsString+'*.rtf不存在');
        exit;
      end else begin
        DM.ADO571.Edit;
        for j:=0 to 9 do
        if DM.tmp.Locate('rkey',DM.ADO571.FieldByName('PARA_ptr_'+inttostr(j)).AsInteger,[]) then
          DM.ADO571.FieldByName('PARA_VALUE_'+inttostr(j)).Value:=DM.getval(DM.tmp.Fields[1].asinteger);
        DM.ADO571.Post;
      end;
    end;
begin
  DirectoryListBox1.OpenCurrent;
  sDir:=DirectoryListBox1.Directory;
  if sDir[length(sDir)]<>'\' then sDir:=sDir+'\';
  Animate1.Visible:=true;
  Animate1.Active:=true;

  DM.tmp.Close;                       //XG,IG,AG分别代表,最大,最小,平均测量值
  DM.tmp.SQL.Text:='select rkey,case when spec_rkey=''XG'' then 0 '+
                                     'when spec_rkey=''IG'' then 1 '+
                                     'when spec_rkey=''AG'' then 2 end spec_rkey '+
                   'from data0278 where spec_rkey in (''XG'',''IG'',''AG'')';
  DM.tmp.Open;

  if RdBtnAll.Checked then
  begin
    DM.ADO571.DisableControls;
    svFlag:=true;
    DM.ADO571.First;
    while not DM.ADO571.Eof do begin excut; DM.ADO571.Next;end;
    DM.ADO571.EnableControls;
    svFlag:=false;
  end else
    excut ;
  Animate1.Active:=false;
  modalresult:=mrok;
end;

end.
