library myFTP;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
//  uMain in 'uMain.pas',
  uPB in 'uPB.pas' {frmPB};

{$R *.res}

function Up(FileName: PAnsiChar):Boolean;stdcall;
begin
  frmPB:=TfrmPB.Create(nil);
  frmPB.Show;
  try
    try
      Application.ProcessMessages;
      if frmPB.UpLoadFTP(FileName) then Result:= True
      else Result:= False;
    except
      Result:= False;
    end;
  finally
    frmPB.Free;
  end;
end;

function Down(DataBaseFileName, dlgFileName: PAnsiChar):Boolean;stdcall;
begin
  frmPB:=TfrmPB.Create(nil);
  frmPB.Show;
  try
    try
      Application.ProcessMessages;
      if frmPB.DownLoadFTP(DataBaseFileName, dlgFileName) then Result:= True
      else Result:= False;
    except
      Result:= False;
    end;
  finally
    frmPB.Free;
  end;
end;

function Del(FileName: PAnsiChar):Boolean;stdcall;
begin
  frmPB:=TfrmPB.Create(nil);
  frmPB.Show;
  try
    try
      Application.ProcessMessages;
      if frmPB.DeleteFTP(FileName) then Result:= True
      else Result:= False;
    except
      Result:= False;
    end;
  finally
    frmPB.Free;
  end;
end;

exports
  Up, Down, Del;

begin
end.
