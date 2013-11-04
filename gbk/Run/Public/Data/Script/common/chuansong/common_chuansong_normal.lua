--����ģ��

x800019_g_ScriptId = 800019

--**********************************

function x800019_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

end



--**********************************

--�о��¼�

--**********************************

function x800019_OnEnumerate(sceneId, selfId, targetId)

	x800019_TransferFunc(sceneId, selfId, 1, 100, 120)
	
end
--��Ӹ���״̬�£��ӳ�����ʱ�������Ҳ��������
function	x800019_TransferFunc(sceneId, selfId, newSceneId, PosX, PosZ)
	--������û�д������״̬,��ֱ�Ӵ���
	local life=LuaFnIsCharacterLiving( sceneId,selfId)
	if	life==0	then
		return
	else
		if	GetTeamId( sceneId, selfId)<0	then
			if sceneId == newSceneId then
				SetPos(sceneId, selfId,PosX,PosZ)
			else
				NewWorld(sceneId, selfId, newSceneId, PosX, PosZ)
			end
		--�����Ҵ������״̬����������Ӹ���״̬,��ֱ�Ӵ���
		elseif	IsTeamFollow(sceneId, selfId)~=1	then
			if sceneId == newSceneId then
				SetPos(sceneId, selfId,PosX,PosZ)
			else
				NewWorld(sceneId, selfId, newSceneId, PosX, PosZ)
			end
		--�����Ҵ�����Ӹ���״̬,������Ƕӳ�,��С�Ӵ���
		elseif	LuaFnIsTeamLeader(sceneId,selfId)==1	 then
			num=LuaFnGetFollowedMembersCount( sceneId, selfId)
			local mems = {}
			for	i=0,num-1 do
				mems[i] = GetFollowedMember(sceneId, selfId, i)
				if mems[i] == -1 then
					return
				end
			end
			
			if sceneId == newSceneId then
				for	i=0,num-1 do
					SetPos(sceneId, selfId,PosX,PosZ)
				end
			else			
				for	i=0,num-1 do
					NewWorld(sceneId, mems[i], newSceneId, PosX, PosZ)
				end
			end
		--�����Ҵ�����Ӹ���״̬,�Ҳ��Ƕӳ�,�򡭡����Է�����ϢҲ�ð�
		end
	end
end

--��һ�������¼��Ϸ���������õ��Ĵ��͵�
WXSJ_WorldPos= {
				xinshoucun_02={newSceneId=4,PosX=60,PosZ=30},
				yangliucun={newSceneId=2,PosX=60,PosZ=30},
				taohuadao={newSceneId=1,PosX=60,PosZ=30},
				
				}
--sceneid   scenename    country
--  11       ¥������       0 
--  18       ��������       1
--  21       ��������       2
--  24       �ػ�����       3
--  36         ��         



function	x800019_TransferToWorld(sceneId, selfId, Pos)
	if WXSJ_WorldPos[Pos].newSceneId == 11 then
		local country = GetCurCountry(sceneId,selfId)
		local countryscene={11,18,21,24}
		if country == 0 then
			x800019_TransferFunc(sceneId, selfId, countryscene[country+1], WXSJ_WorldPos[Pos].PosX, WXSJ_WorldPos[Pos].PosZ)
		elseif country == 1 then
			x800019_TransferFunc(sceneId, selfId, countryscene[country+1], WXSJ_WorldPos[Pos].PosX, WXSJ_WorldPos[Pos].PosZ)
		elseif country == 2 then
			x800019_TransferFunc(sceneId, selfId, countryscene[country+1], WXSJ_WorldPos[Pos].PosX, WXSJ_WorldPos[Pos].PosZ)
		elseif country == 3 then
			x800019_TransferFunc(sceneId, selfId, countryscene[country+1], WXSJ_WorldPos[Pos].PosX, WXSJ_WorldPos[Pos].PosZ)
		else
			return
		end
	elseif  WXSJ_WorldPos[Pos].newSceneId == 99 then
		local country = GetCurCountry(sceneId,selfId)
		local bianjingscene={99,99,99,99}
		if country == 0 then
			x800019_TransferFunc(sceneId, selfId, bianjingscene[country+1], WXSJ_WorldPos[Pos].PosX, WXSJ_WorldPos[Pos].PosZ)
		elseif country == 1 then
			x800019_TransferFunc(sceneId, selfId, bianjingscene[country+1], WXSJ_WorldPos[Pos].PosX, WXSJ_WorldPos[Pos].PosZ)
		elseif country == 2 then
			x800019_TransferFunc(sceneId, selfId, bianjingscene[country+1], WXSJ_WorldPos[Pos].PosX, WXSJ_WorldPos[Pos].PosZ)
		elseif country == 3 then
			x800019_TransferFunc(sceneId, selfId, bianjingscene[country+1], WXSJ_WorldPos[Pos].PosX, WXSJ_WorldPos[Pos].PosZ)
		else
			return
		end
	else
		x800019_TransferFunc(sceneId, selfId, WXSJ_WorldPos[Pos].newSceneId, WXSJ_WorldPos[Pos].PosX, WXSJ_WorldPos[Pos].PosZ)
	end
end
