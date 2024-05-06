import { getNotice } from "@/src/lib/notice-db";
import { NextRequest } from "next/server";

export async function GET(
  request: NextRequest,
  { params }: { params: { _id: string } }
) {
  try {
    const { _id } = params;

    if (!_id) {
      return Response.json({ error: "_id is required" });
    }
    const data = await getNotice(_id);

    return Response.json({ data });
  } catch (error) {
    return Response.json({ error }, { status: 500 });
  }
}
